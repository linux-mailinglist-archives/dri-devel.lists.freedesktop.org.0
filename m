Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C33C928E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 22:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85726E435;
	Wed, 14 Jul 2021 20:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9C06E435
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:51:21 +0000 (UTC)
Date: Wed, 14 Jul 2021 21:51:10 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/panel: Add Innolux EJ030NA 3.0" 320x480 panel
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <AX59WQ.6WM2VCZMWB3M2@crapouillou.net>
In-Reply-To: <YOk7xCNes0VTCG21@ravnborg.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <20210625121045.81711-2-paul@crapouillou.net>
 <YOk7xCNes0VTCG21@ravnborg.org>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le sam., juil. 10 2021 at 08:18:44 +0200, Sam Ravnborg=20
<sam@ravnborg.org> a =E9crit :
> Hi Paul, Christophe,
>=20
> On Fri, Jun 25, 2021 at 01:10:45PM +0100, Paul Cercueil wrote:
>>  From: Christophe Branchereau <cbranchereau@gmail.com>
>>=20
>>  Add support for the Innolux/Chimei EJ030NA 3.0"
>>  320x480 TFT panel.
>>=20
>>  This panel can be found in the LDKs, RS97 V2.1 and RG300 (non IPS)
>>  handheld gaming consoles.
>>=20
>>  While being 320x480, it is actually a horizontal 4:3
>>  panel with non-square pixels in delta arrangement.
>>=20
>>  Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> The drivers looks good.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Pushed to drm-misc-next.

Thanks for the review!

Cheers,
-Paul


