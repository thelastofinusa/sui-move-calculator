import * as React from "react";

import {
  ConnectButton,
  useCurrentAccount,
  useSignAndExecuteTransaction,
  useSuiClient,
  useSuiClientQuery,
} from "@mysten/dapp-kit";
import type { SuiObjectData } from "@mysten/sui/client";
import { Transaction } from "@mysten/sui/transactions";
import { isValidSuiObjectId } from "@mysten/sui/utils";
import { Button } from "./components/ui/button";
import { useNetworkVariable } from "./config/network.config";

function App() {
  const currentAccount = useCurrentAccount();
  const [calculatorId, setCalculatorId] = React.useState(() => {
    const hash = window.location.hash.slice(1);
    return isValidSuiObjectId(hash) ? hash : null;
  });

  return (
    <div className="flex min-h-svh flex-col items-center justify-center">
      <div className="max-w-sm w-full space-y-16">
        <div className="flex items-center gap-4">
          {currentAccount && (
            <Button
              variant="secondary"
              className="flex-1"
              size={"lg"}
              onClick={() => {
                window.open(
                  `https://faucet.sui.io/?address=${currentAccount.address}`,
                  "_blank"
                );
              }}
            >
              Get Testnet SUI
            </Button>
          )}
          <ConnectButton connectText="Connect" />
        </div>
        <div className="flex flex-col gap-4">
          {currentAccount ? (
            calculatorId ? (
              <Calculate id={calculatorId} />
            ) : (
              <CreateCalculator
                onCreated={(id) => {
                  window.location.hash = id;
                  setCalculatorId(id);
                }}
              />
            )
          ) : (
            <p>Please connect your wallet</p>
          )}
        </div>
      </div>
    </div>
  );
}

export default App;

function CreateCalculator({ onCreated }: { onCreated: (id: string) => void }) {
  const calculatorPackageId = useNetworkVariable("calculatorPackageId");
  const calculatorModules = useNetworkVariable("calculatorModules");
  const suiClient = useSuiClient();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();

  const [waitingForTxn, setWaitingForTxn] = React.useState(false);

  const create = () => {
    setWaitingForTxn(true);

    const tx = new Transaction();

    tx.moveCall({
      arguments: [],
      target: `${calculatorPackageId}::${calculatorModules}::new`,
    });

    signAndExecute(
      {
        transaction: tx,
      },
      {
        onSuccess: (tx) => {
          suiClient
            .waitForTransaction({
              digest: tx.digest,
              options: { showEffects: true },
            })
            .then(async (result) => {
              const objectId =
                result.effects?.created?.[0]?.reference?.objectId;
              if (objectId) {
                onCreated(objectId);
                setWaitingForTxn(false);
              }
            });
        },
      }
    );
  };

  return (
    <Button
      onClick={create}
      isLoading={waitingForTxn}
      loadingText="Please wait..."
      className="w-max"
    >
      Create Calculator
    </Button>
  );
}

function Calculate({ id }: { id: string }) {
  const suiClient = useSuiClient();
  const calculatorPackageId = useNetworkVariable("calculatorPackageId");
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();
  const { data, isPending, error, refetch } = useSuiClientQuery("getObject", {
    id,
    options: {
      showContent: true,
    },
  });

  return <div>calculate</div>;
}
