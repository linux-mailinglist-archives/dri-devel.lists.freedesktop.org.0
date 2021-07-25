Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD83D5091
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 01:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDCE6E479;
	Sun, 25 Jul 2021 23:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807426E479
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 23:06:54 +0000 (UTC)
Date: Mon, 26 Jul 2021 00:06:44 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add DT bindings for QiShenglong
 Gopher 2b panel
To: Artjom Vejsel <akawolf0@gmail.com>
Message-Id: <8JPTWQ.0T8NM4BDXSSK2@crapouillou.net>
In-Reply-To: <20210725221527.1771892-3-akawolf0@gmail.com>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-3-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artjom,

Le lun., juil. 26 2021 at 01:15:26 +0300, Artjom Vejsel=20
<akawolf0@gmail.com> a =E9crit :
> Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD=20
> panel.
>=20
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2=20
> ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml=20
> b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 3624363938dd..e7f3db118c5d 100644
> ---=20
> a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++=20
> b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -244,6 +244,8 @@ properties:
>        - powertip,ph800480t013-idf02
>          # QiaoDian XianShi Corporation 4"3 TFT LCD panel
>        - qiaodian,qd43003c0-40
> +        # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b=20
> 4.3" 480(RGB)x272 TFT LCD panel
> +      - qishenglong,gopher2b-lcd-panel
>          # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
>        - rocktech,rk101ii01d-ct
>          # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD=20
> panel
> --
> 2.32.0
>=20


