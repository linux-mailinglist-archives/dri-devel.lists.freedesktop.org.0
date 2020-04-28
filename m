Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0D1BC624
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48116E859;
	Tue, 28 Apr 2020 17:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209726E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 17:06:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7B1AD20022;
 Tue, 28 Apr 2020 19:06:00 +0200 (CEST)
Date: Tue, 28 Apr 2020 19:05:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add IVO M133NWF4 R0
Message-ID: <20200428170559.GC27234@ravnborg.org>
References: <20200420215728.1927434-1-bjorn.andersson@linaro.org>
 <20200425175842.GA3773@ravnborg.org>
 <CAL_JsqL6bMwrXZqvGz_H_aJi+EeoikBwKznLP2VomJ=Wn822Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL6bMwrXZqvGz_H_aJi+EeoikBwKznLP2VomJ=Wn822Rg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8
 a=3hrhdDLJ5tPtOPOkrE4A:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

On Tue, Apr 28, 2020 at 09:27:51AM -0500, Rob Herring wrote:
> On Sat, Apr 25, 2020 at 12:58 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Bj=F6rn.
> >
> > On Mon, Apr 20, 2020 at 02:57:27PM -0700, Bjorn Andersson wrote:
> > > Define the vendor prefix for InfoVision Optoelectronics and add their
> > > M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel to the compatible list
> > > of panel-simple.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > I got OK for the vendor prefix on irc so patch is now added to
> > drm-misc-next.
> > Another time please use a dedicated patch for vendor-prefix
> > so it is not hidden with other stuff. This way the chance
> > to get the attention of the right people is better.
> =

> I should have mentioned there's basically one thing to check:
> alphabetical order.
I thought I checked that, but obviously not - hrmpf..
I will post a follow-up patch for drm-misc-next to fix it.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
