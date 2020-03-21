Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2F18E4B0
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 22:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4D16E365;
	Sat, 21 Mar 2020 21:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133896E365
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 21:04:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D5B2E8050E;
 Sat, 21 Mar 2020 22:04:12 +0100 (CET)
Date: Sat, 21 Mar 2020 22:04:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: display: grammar fixes in panel/
Message-ID: <20200321210411.GA17581@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-4-sam@ravnborg.org>
 <20200317192522.GD2527@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317192522.GD2527@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8
 a=D-DU-lTQCvLRNRuGbxsA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=AjGcO6oz07-iQ99wixmX:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Tue, Mar 17, 2020 at 09:25:22PM +0200, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Sat, Mar 14, 2020 at 04:30:47PM +0100, Sam Ravnborg wrote:
> > Fix a few grammar/editorial issues spotted by Laurent Pinchart.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/display/panel/display-timings.yaml           | 8 ++++----
> >  .../devicetree/bindings/display/panel/panel-common.yaml   | 4 ++--
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> > index c8c0c9cb0492..56903ded005e 100644
> > --- a/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: display timing bindings
> > +title: display timings bindings
> >  
> >  maintainers:
> >    - Thierry Reding <thierry.reding@gmail.com>
> > @@ -14,7 +14,7 @@ maintainers:
> >  description: |
> >    A display panel may be able to handle several display timings,
> >    with different resolutions.
> > -  The display-timings node makes it possible to specify the timing
> > +  The display-timings node makes it possible to specify the timings
> >    and to specify the timing that is native for the display.
> >  
> >  properties:
> > @@ -25,8 +25,8 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description: |
> >        The default display timing is the one specified as native-mode.
> > -      If no native-mode is specified then the first node is assumed the
> > -      native mode.
> > +      If no native-mode is specified then the first node is assumed
> > +      to be the native mode.
> >  
> >  patternProperties:
> >    "^timing":
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > index ed051ba12084..dee4faffd204 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > @@ -63,9 +63,9 @@ properties:
> >  
> >    display-timings:
> >      description:
> > -      Some display panels supports several resolutions with different timing.
> > +      Some display panels supports several resolutions with different timings.
> 
> s/supports/support/
> 
> >        The display-timings bindings supports specifying several timings and
> > -      optional specify which is the native mode.
> > +      optionally specify which is the native mode.
> 
> s/specify/specifying/ ?
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Fixed the above and applied this patch to drm-misc-next.
The other patches awaits that drm-misc-next-fixes is ready

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
