import { getFullnodeUrl } from "@mysten/sui/client";

import { createNetworkConfig } from "@mysten/dapp-kit";
import {
  TESTNET_CALCULATOR_PACKAGE_ID,
  TESTNET_CALCULATOR_MODULES,
} from "@/constants";

const { networkConfig, useNetworkVariable, useNetworkVariables } =
  createNetworkConfig({
    testnet: {
      url: getFullnodeUrl("testnet"),
      variables: {
        calculatorPackageId: TESTNET_CALCULATOR_PACKAGE_ID,
        calculatorModules: TESTNET_CALCULATOR_MODULES,
      },
    },
  });

export { useNetworkVariable, useNetworkVariables, networkConfig };
