package common

import "github.com/SuSy-One/susy-v2/node/pkg/readiness"

const (
	ReadinessEthSyncing     readiness.Component = "ethSyncing"
	ReadinessSolanaSyncing  readiness.Component = "solanaSyncing"
	ReadinessTerraSyncing   readiness.Component = "terraSyncing"
	ReadinessBSCSyncing     readiness.Component = "bscSyncing"
	ReadinessPolygonSyncing readiness.Component = "polygonSyncing"
)
