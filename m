Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45494A6E42
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7E310E43E;
	Wed,  2 Feb 2022 09:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D73610E43E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:57:43 +0000 (UTC)
Date: Wed, 02 Feb 2022 09:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1643795860;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=lkUIEQ9WK4AXAQwTltuUgiDu7dO2rSFOc7+tTQHlbeaxeVfTgnjJ0r2nj2xihoHR5
 oJxPspuSG+OQQyqHoxN5xjkvNXYvQAdRiWleNecp16Sbtudo8dn4RLnoAB5pfcRovn
 oQQ/wJ9GQh0T7FgM1muqFQm8oUb7gVr8bUt/EUyuUdvqUz+MrvpjzjOlwNEtnFTvkD
 UwoyXYiPGQu0e7g8K0j94zOmSjGxdmTzoFlAW0uQBOWNDhrRHQopgq3JzyKtPv0qY0
 P6jihfHStoFhi1kEZaONtll3GFsXvFBiTlUKSbUpBv7k+XvMRow4hP1nh2Xsq3v9qY
 EPwWN3Y4ciN+g==
To: Maxime Ripard <maxime@cerno.tech>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: Fix typo in documentation
Message-ID: <LcIXh8utB4QsQFjgEtLCjH3ypXUC1nLofh2MjltnYqA8mbXiGCwfY_WB75Tcj6HjqFT-2fJVo5_mOcd0XKD-MBZgkkU2KdXCaRHQEB4jd3I=@emersion.fr>
In-Reply-To: <20220202094340.875190-1-maxime@cerno.tech>
References: <20220202094340.875190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
