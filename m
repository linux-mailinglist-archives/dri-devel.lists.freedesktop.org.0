Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA12451E1
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AE46E17D;
	Sat, 15 Aug 2020 21:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C846E17D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:27:54 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DAB1F80542;
 Sat, 15 Aug 2020 23:27:51 +0200 (CEST)
Date: Sat, 15 Aug 2020 23:27:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add mantix vendor
 prefix
Message-ID: <20200815212750.GB1244923@ravnborg.org>
References: <cover.1597526107.git.agx@sigxcpu.org>
 <5c3739d07630636218ea2814299ec5e0dffeb9ea.1597526107.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c3739d07630636218ea2814299ec5e0dffeb9ea.1597526107.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=7gkXJVJtAAAA:8 a=cc3Y6kAsAAAA:8
 a=meAXSaOurwoO8qVPktAA:9 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=53xj2swMd_UVqmSCrZtM:22
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 15, 2020 at 11:16:20PM +0200, Guido G=FCnther wrote:
> Add prefix for Mantix Display Technology Co.,Ltd.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 2baee2c817c1a..59d4c8b068c4d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -611,6 +611,8 @@ patternProperties:
>      description: Linux Automation GmbH
>    "^macnica,.*":
>      description: Macnica Americas
> +  "^mantix,.*":
> +    description: Mantix Display Technology Co.,Ltd.
>    "^mapleboard,.*":
>      description: Mapleboard.org
>    "^marvell,.*":
> -- =

> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
