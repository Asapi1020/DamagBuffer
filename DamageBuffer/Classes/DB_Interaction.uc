class DB_Interaction extends Interaction;

var KFPowerUp_DamageBuf MyPowerUp;

function InitPowerUp(KFPowerUp_DamageBuf NewPowerUp)
{
	MyPowerUp = NewPowerUp;
}

exec function DamageBuff(float Modifier)
{
	MyPowerUp.DamageModifier = Modifier;
	LogToConsole("DamageModifier = " $ string(MyPowerUp.DamageModifier));
	MyPowerUp.ReactivatePowerUp();
}

//	Offline Only
static final function LogToConsole(string Text)
{
    local KFGameEngine KFGE;
    local KFGameViewportClient KFGVC;
    local Console TheConsole;
    
    KFGE = KFGameEngine(class'Engine'.Static.GetEngine());
    
    if (KFGE != none)
    {
        KFGVC = KFGameViewportClient(KFGE.GameViewport);
        
        if (KFGVC != none)
        {
            TheConsole = KFGVC.ViewportConsole;
            
            if (TheConsole != none)
                TheConsole.OutputText( "[DamageBuffer] " $ Text);
        }
    }
}