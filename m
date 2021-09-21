Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7B4139D3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6316EA1C;
	Tue, 21 Sep 2021 18:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E815B6EA1C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:13:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u8so906535lff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EW1vW7sWjftd7hrs0dLX4IMwefEJeY8UuH5WCPSWExA=;
 b=LZJuB9HS05MS44ICxvif8myY5ie/+eFNBBomTnoXTSqdYFutmN16Rl/OjOLkZZh6jQ
 72pjRft7V+Wg6EUsnSOgvRWWq82TlnqfhIMtpVZDHpU7AnAXxIhhHDjqFLeMBbO7op3M
 v+4rG8XZGjTqtzgkqZQt07pEhpBpxQS1aBjTk+4MBijZG5ISNv7YFGJwaTxUe8F3hvH3
 1qZ1QCO2vr+49tpOCMCCLQHXfvzLfpUt/Y9QP6NAySr9mkROwv7XaqX0F/8RLQRLgFri
 O8v6fRSXBZax1tldtMvaevvAoGhAxOFmu+vocFyUGYkt/45OxJgu7tC8JPU6fF5KeKT8
 3M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EW1vW7sWjftd7hrs0dLX4IMwefEJeY8UuH5WCPSWExA=;
 b=mzIiqpK+7Vc9bcgeKRKeMWlAIbmyic5eeqO72c3Kjn4mSwMDo4fOsLPLNf3FrVKumq
 aq4qoiINtYY098oKiHOUFYHU9X2KDiGERcJLAi35DINzFC7Gpf1E1e5jCQ/RFg6StbUe
 oCy2W+d0mpFeCXCZntmXZqPSfgLifd3Cge9g2Ci3xKBqGesFq0333vYgXGDepxnCdLVq
 bPu6PE757Rr2WFpsCTxZh6fmvX6jyb0ESjbwmPj40/hXj1DnmCB4f4zryORUX9z6ZaNc
 iyo+IGJ99EBuq8FCT25PViHB97UdosDwLaPa5dPsAVTGmNkzZ7W9whjKwAYmUEN7Is+X
 bvXg==
X-Gm-Message-State: AOAM531U4hy9pCQSOrcE7/BZUG99K1vIcStjDkGlx9UbLzEtau26Azf3
 PuvkKncgf2E3XXPq6RYZJ/acRpLfNmfQc159UvLDSDyT2q8=
X-Google-Smtp-Source: ABdhPJyHNbMQuJb6Tgu7TZrvW5IeIkg4OaG9Y6i4c0e5aLwDyZE47u/VgQ/J+p/1JvRrc8gmONqFKIBQHcXEe0PYUGY=
X-Received: by 2002:a2e:b5a7:: with SMTP id f7mr29396764ljn.19.1632247996570; 
 Tue, 21 Sep 2021 11:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210921122146.13132-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210921122146.13132-1-lukas.bulwahn@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Sep 2021 20:13:05 +0200
Message-ID: <CACRpkdbW+rP4mj6RWCAJRnW7yWTnfZXBcRnKO=mfdwFL-qVhGg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in DRM DRIVER FOR SAMSUNG S6D27A1
 PANELS
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 phone-devel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 21, 2021 at 2:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit ebd8cbf1fb96 ("drm/panel: s6d27a1: Add driver for Samsung S6D27A1
> display panel") introduces a new section DRM DRIVER FOR SAMSUNG S6D27A1
> PANELS with a minor typo in one of its file entries.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches  F:  driver/gpu/drm/panel/panel-samsung-s6d27a1.c
>
> So, repair the entry and make get_maintainer.pl happy.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210920
>
> Linus, please pick this minor quick clean-up patch on drm-misc-next
> (on top of the commit mentioned above).

Patch applied!

Yours,
Linus Walleij
