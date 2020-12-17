Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A82DD60C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 18:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DC589916;
	Thu, 17 Dec 2020 17:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1F89916
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 17:26:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 733C580567;
 Thu, 17 Dec 2020 18:25:58 +0100 (CET)
Date: Thu, 17 Dec 2020 18:25:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358768: Remove
 maintainer information
Message-ID: <20201217172556.GA1339623@ravnborg.org>
References: <20201215124227.1872-1-peter.ujfalusi@ti.com>
 <1608042367.307112.3775381.nullmailer@robh.at.kernel.org>
 <90d45716-4f4e-7379-07fd-74eff793e498@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90d45716-4f4e-7379-07fd-74eff793e498@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=krgCvxnHoqGKM54YNBcA:9
 a=CjuIK1q_8ugA:10 a=U8x1aBgNEqwA:10 a=aeg5Gbbo78KNqacMgKqU:22
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter.

On Wed, Dec 16, 2020 at 09:44:59AM +0200, Peter Ujfalusi wrote:
> 
> On 15/12/2020 16.26, Rob Herring wrote:
> > On Tue, 15 Dec 2020 14:42:27 +0200, Peter Ujfalusi wrote:
> >> My employment with TI is coming to an end and I will not have access to
> >> the board where this bridge is connected to.
> >>
> >> It is better to remove a soon bouncing email address.
> >>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> >> ---
> >>  .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml   | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml: 'maintainers' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml: ignoring, error in schema: 
> > warning: no schema found in file: ./Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> 
> Right, so it is not that easy to not been able to maintain this... :o
> 
> Who should be documented as maintainer?
> Andrzej, Neil, David or Daniel?

I have no problem being listed as maintainer despite my very limited
knowledge on the HW. So unless you end up volunteering then just
add me.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
