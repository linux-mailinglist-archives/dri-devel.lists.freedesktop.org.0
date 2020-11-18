Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2D2B78B2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033376E420;
	Wed, 18 Nov 2020 08:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DEA6E419
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id EABA2FB03;
 Wed, 18 Nov 2020 09:30:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WhnadPvPYcT7; Wed, 18 Nov 2020 09:30:24 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B053D43F6E; Wed, 18 Nov 2020 09:30:23 +0100 (CET)
Date: Wed, 18 Nov 2020 09:30:23 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 5/6] dt-bindings: vendor-prefixes: Add ys vendor prefix
Message-ID: <20201118083023.GA6684@bogon.m.sigxcpu.org>
References: <cover.1605635248.git.agx@sigxcpu.org>
 <a4930fb7a7464e4feedbdae993fe25080c8f5490.1605635248.git.agx@sigxcpu.org>
 <CACRpkdao_TMcpRsdK=7K5fNKJse0Bqwk58iWu0xsXdDNdcffVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdao_TMcpRsdK=7K5fNKJse0Bqwk58iWu0xsXdDNdcffVA@mail.gmail.com>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Tue, Nov 17, 2020 at 09:42:33PM +0100, Linus Walleij wrote:
> On Tue, Nov 17, 2020 at 6:49 PM Guido G=FCnther <agx@sigxcpu.org> wrote:
> =

> > Add prefix for Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
> >
> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index e40ee369f808..d0f3abf2f12c 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1220,6 +1220,8 @@ patternProperties:
> >      description: Shenzhen Yangliming Electronic Technology Co., Ltd.
> >    "^yna,.*":
> >      description: YSH & ATIL
> > +  "^ys,.*":
> > +    description: Shenzhen Yashi Changhua Intelligent Technology Co., L=
td.
> >    "^yones-toptech,.*":
> >      description: Yones Toptech Co., Ltd.
> >    "^ysoft,.*":
> =

> I think this should be in alphabetical order of the compatible string, i.=
e.
> under yones.

Messed that up during rebase. Fixed in v2.
Thanks for the review!
 -- Guido

> =

> Yours,
> Linus Walleij
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
