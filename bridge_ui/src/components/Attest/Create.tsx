import { Button, CircularProgress, makeStyles } from "@material-ui/core";
import { useCallback } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useSolanaWallet } from "../../contexts/SolanaWalletContext";
import useAttestSignedVAA from "../../hooks/useAttestSignedVAA";
import { setIsCreating } from "../../store/attestSlice";
import {
  selectAttestIsCreating,
  selectAttestTargetChain,
} from "../../store/selectors";
import { CHAIN_ID_SOLANA } from "../../utils/consts";
import createWrappedOn, {
  createWrappedOnSolana,
} from "../../utils/createWrappedOn";

const useStyles = makeStyles((theme) => ({
  transferButton: {
    marginTop: theme.spacing(2),
    textTransform: "none",
    width: "100%",
  },
}));

function Create() {
  const dispatch = useDispatch();
  const classes = useStyles();
  const targetChain = useSelector(selectAttestTargetChain);
  const { wallet } = useSolanaWallet();
  const solPK = wallet?.publicKey;
  const signedVAA = useAttestSignedVAA();
  const isCreating = useSelector(selectAttestIsCreating);
  const handleCreateClick = useCallback(() => {
    if (
      targetChain === CHAIN_ID_SOLANA &&
      createWrappedOn[targetChain] === createWrappedOnSolana &&
      signedVAA
    ) {
      dispatch(setIsCreating(true));
      createWrappedOnSolana(wallet, solPK?.toString(), signedVAA);
    }
  }, [dispatch, targetChain, wallet, solPK, signedVAA]);
  return (
    <div style={{ position: "relative" }}>
      <Button
        color="primary"
        variant="contained"
        className={classes.transferButton}
        disabled={isCreating}
        onClick={handleCreateClick}
      >
        Create
      </Button>
      {isCreating ? (
        <CircularProgress
          size={24}
          color="inherit"
          style={{
            position: "absolute",
            bottom: 0,
            left: "50%",
            marginLeft: -12,
            marginBottom: 6,
          }}
        />
      ) : null}
    </div>
  );
}

export default Create;