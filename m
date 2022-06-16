Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CE54DC4D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F1A10E00C;
	Thu, 16 Jun 2022 07:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E5F89581
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:58:32 +0000 (UTC)
X-UUID: bd2263d9bb1e4b15a2a64391bdd8bcea-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:29631f43-a9ea-425e-a757-b07ef1dab258, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:70
X-CID-INFO: VERSION:1.1.6, REQID:29631f43-a9ea-425e-a757-b07ef1dab258, OB:0,
 LOB:
 0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:70
X-CID-META: VersionHash:b14ad71, CLOUDID:e7c1b848-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:a6fd8a06a213,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: bd2263d9bb1e4b15a2a64391bdd8bcea-20220616
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2102525772; Thu, 16 Jun 2022 15:58:26 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 16 Jun 2022 15:58:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 15:58:25 +0800
Message-ID: <cf145ac2a053d6b84d70e24ae6c13dda37967fa4.camel@mediatek.com>
Subject: Re: [PATCH v11 01/12] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Thu, 16 Jun 2022 15:58:25 +0800
In-Reply-To: <197b586898cad244037cf404cdff2846f5c0e10a.camel@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-2-rex-bc.chen@mediatek.com>
 <197b586898cad244037cf404cdff2846f5c0e10a.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-14 at 11:05 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > DP_INTF is similar to DPI but does not have the exact same feature
> > set
> > or register layouts.
> > 
> > DP_INTF is the sink of the display pipeline that is connected to
> > the
> > DisplayPort controller and encoder unit. It takes the same clocks
> > as
> > DPI.
> > 
> > In this patch, we also do these string replacement:
> > - s/mediatek/MediaTek/ in title.
> > - s/Mediatek/MediaTek/ in description.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-
> > --
> > --
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > index 77ee1b923991..ca1b48e78581 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y
> > am
> > l
> > @@ -4,16 +4,16 @@
> >  $id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: MediaTek DPI and DP_INTF Controller
> >  
> >  maintainers:
> >    - CK Hu <ck.hu@mediatek.com>
> >    - Jitao shi <jitao.shi@mediatek.com>
> >  
> >  description: |
> > -  The Mediatek DPI function block is a sink of the display
> > subsystem
> > and
> > -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> > parallel
> > -  output bus.
> > +  The MediaTek DPI and DP_INTF function blocks are a sink of the
> > display
> > +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422
> > pixel data on a
> > +  parallel output bus.
> >  
> >  properties:
> >    compatible:
> > @@ -24,6 +24,7 @@ properties:
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dp_intf
> >  
> >    reg:
> >      maxItems: 1
> > @@ -36,12 +37,14 @@ properties:
> >        - description: Pixel Clock
> >        - description: Engine Clock
> >        - description: DPI PLL
> > +      - description: Clock gate for PLL
> 
> Why DP_INTF has this additional clock? What is the new hardware block
> (compared with DPI) need this clock? Why this is different than DPI?
> 
> Regards,
> CK
> 

Hello CK,

as previous reply, I will remove this clock.

BRs,
Bo-Chen

> >  
> >    clock-names:
> >      items:
> >        - const: pixel
> >        - const: engine
> >        - const: pll
> > +      - const: pll_gate
> >  
> >    pinctrl-0: true
> >    pinctrl-1: true
> > @@ -55,7 +58,7 @@ properties:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description:
> >        Output port node. This port should be connected to the input
> > port of an
> > -      attached HDMI or LVDS encoder chip.
> > +      attached HDMI, LVDS or DisplayPort encoder chip.
> >  
> >  required:
> >    - compatible
> 
> 

