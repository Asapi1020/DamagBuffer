class DamageBufferMut extends KFMutator;

function ModifyPlayer(Pawn Other)
{
	local KFPawn Player;
	local KFPlayerController KFPC;

	super.ModifyPlayer(Other);

	Player = KFPawn_Human(Other);
	KFPC = KFPlayerController(Player.Controller);

	if( KFPC != none )
    {
        KFPC.ReceivePowerUp(class'DamageBuffer.KFPowerUp_DamageBuf');
    }
}