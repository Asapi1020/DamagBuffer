class KFPowerUp_DamageBuf extends KFPowerUp;

var DB_Interaction DBI;
var float DamageModifier;

function ActivatePowerUp()
{
	super.ActivatePowerUp();
	if(Role == Role_Authority && bPowerUpActive)
	{
		InitInteraction();
	}
}

function InitInteraction()
{
	DBI = new (self) class'DamageBuffer.DB_Interaction';
	DBI.InitPowerUp(self);
	KFPlayerController(OwnerPawn.Controller).Interactions.AddItem(DBI);
}

function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local float TempDamage;
	TempDamage = InDamage;

	if( DamageCauser != none )
	{
		TempDamage += InDamage * DamageModifier;
		DBI.LogToConsole("FinalDamage: " $ string(Round(TempDamage)) $ ", OriginalDamage: " $ string(InDamage));
	}

	InDamage = Round( TempDamage );
}

defaultproperties
{
	PowerUpDuration = 2147483647.f
}