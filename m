Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640B4B43C2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 09:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318010E1DA;
	Mon, 14 Feb 2022 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB0410E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 08:17:34 +0000 (UTC)
X-UUID: ba02a0a5cd744629baf2b0a3f721af3c-20220214
X-UUID: ba02a0a5cd744629baf2b0a3f721af3c-20220214
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 727129658; Mon, 14 Feb 2022 16:17:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 16:17:29 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 16:17:27 +0800
Message-ID: <19bec780f6d27983e9b62afed8fff4c0f988946b.camel@mediatek.com>
Subject: Re: [v1, 1/3] dt-bindings: display: mediatek: dsi: add
 documentation for MT8186 SoC
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Mon, 14 Feb 2022 16:17:35 +0800
In-Reply-To: <846d50400a14129c5ff7f7acb2b23f9f4658d11f.camel@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
 <1643283773-7081-2-git-send-email-xinlei.lee@mediatek.com>
 <846d50400a14129c5ff7f7acb2b23f9f4658d11f.camel@mediatek.com>
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
Cc: jitao.shi@mediatek.com, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-28 at 13:08 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-01-27 at 19:42 +0800, xinlei.lee@mediatek.com wrote:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > Add binding documentation for the MT8186 SoC.
> 
> DPI has a yaml format document, so I would like DSI also has a yaml
> format document.
> Please send a patch to transfer DSI document to yaml, and then apply
> this patch to yaml document.
> 
> Regards,
> CK
> 
Hi, CK:

I have prepared DSI document to yaml, and will sent it out in the next
edition.
Thanks for your suggestion.

Best Regards!
xinlei
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.tx
> > t
> > > 2 +-
> > 
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > index 36b0145..c82b8b2 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > @@ -7,7 +7,7 @@ channel output.
> >  
> >  Required properties:
> >  - compatible: "mediatek,<chip>-dsi"
> > -- the supported chips are mt2701, mt7623, mt8167, mt8173 and
> > mt8183.
> > +- the supported chips are mt2701, mt7623, mt8167, mt8173, mt8183
> > and
> > mt8186.
> >  - reg: Physical base address and length of the controller's
> > registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clocks
> 
> 

