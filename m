Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A789607A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 02:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1871A1121E5;
	Wed,  3 Apr 2024 00:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Wed, 03 Apr 2024 00:05:49 UTC
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E991121E5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 00:05:49 +0000 (UTC)
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay01.hostedemail.com (Postfix) with ESMTP id C66FD1C0CF7;
 Tue,  2 Apr 2024 23:58:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf15.hostedemail.com (Postfix) with ESMTPA id 6EE5E17; 
 Tue,  2 Apr 2024 23:58:54 +0000 (UTC)
Message-ID: <d02ec26aef6936e07f55a8bda5ae512da8832a73.camel@perches.com>
Subject: Re: [PATCH 1/4] gpu/drm: Add SPDX-license-Identifier tag
From: Joe Perches <joe@perches.com>
To: Nicolas Devos <ndevos-dev@pm.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 02 Apr 2024 16:58:53 -0700
In-Reply-To: <20240402224320.12146-2-ndevos-dev@pm.me>
References: <20240402224320.12146-1-ndevos-dev@pm.me>
 <20240402224320.12146-2-ndevos-dev@pm.me>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6EE5E17
X-Spam-Status: No, score=-3.11
X-Stat-Signature: 4wmozogddxmk5hfhmmd9479c5odqeeip
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19NiLFGrVxiJasVrRhQDoiUnMvu4sCsRM8=
X-HE-Tag: 1712102334-125308
X-HE-Meta: U2FsdGVkX1/fs3ut+OQjMslc2yAXCaqSV62VOB/hfUAJRhPNYP7hQN+N7MUlEeZGuDOLuc4N6FniN0CLvJS41G3TwpPjMMhl3hKnk9EWMFmtn7B1KRAG86FSj0087yBxKyF/L7BKfRuOAbFDsP+TIcGZIOGG2s3KLu9glSGQ47Yjk3oDucXljkoE/4WZtUGEX5FYTM6EDuVL08uh4jrJhx7B3OHZFkkx4bSyWhN7Ktg1ip47kjBnBX3Iajx6A5Olu8rVYTL9wfKM+iEjOb0Bay6NN16sx02P7+bsM1EVUtJBcTrsUzwdnBaWDzRk+Fgu
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-04-02 at 22:43 +0000, Nicolas Devos wrote:
> This commit fixes following checkpatch warning:
> WARNING: Missing or malformed SPDX-License-Identifier tag

NAK without specific agreement from Intel.

The existing license in the file is neither GPL nor MIT

>=20
> Signed-off-by: Nicolas Devos <ndevos-dev@pm.me>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b0516505f7ae..40350256b1f6 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
>  /*
>   * Copyright (c) 2016 Intel Corporation
>   *

