Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8A2D28AC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 11:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1A86E0C1;
	Tue,  8 Dec 2020 10:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78496E0C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 10:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 0F5B8FB03;
 Tue,  8 Dec 2020 11:19:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 329PfmN7beNV; Tue,  8 Dec 2020 11:19:18 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 959564068D; Tue,  8 Dec 2020 11:19:17 +0100 (CET)
Date: Tue, 8 Dec 2020 11:19:17 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] dt-binding: display: mantix: Add compatible for
 panel from YS
Message-ID: <20201208101917.GA30738@bogon.m.sigxcpu.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
 <eb2a0e50cbb8cfebc27d259607e543fedb8c6b27.1605688147.git.agx@sigxcpu.org>
 <20201207213206.GA864202@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207213206.GA864202@robh.at.kernel.org>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Dec 07, 2020 at 03:32:06PM -0600, Rob Herring wrote:
> On Wed, 18 Nov 2020 09:29:53 +0100, Guido G=FCnther wrote:
> > This panel from Shenzhen Yashi Changhua Intelligent Technology Co
> > uses the same driver IC but a different LCD.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  .../devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml  | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> =

> Acked-by: Rob Herring <robh@kernel.org>
> =


Thanks! I've appplied the series to drm-misc-next now.
Cheers,
 -- Guido
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
