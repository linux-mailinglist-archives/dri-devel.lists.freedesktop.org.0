Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A07AD66CC41
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F6210E46E;
	Mon, 16 Jan 2023 17:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F65910E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 17:23:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 451A1B810A0;
 Mon, 16 Jan 2023 17:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC4EC433EF;
 Mon, 16 Jan 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673889828;
 bh=JYdgMzjX3SdtHUhlc4JqQNlQEpIgJ4tHf+fTdHFdHb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YppIn6k9jGPDSp77P5hlkqwbe3XdHs8C+pzPcjc4LzgHZq9iYLlDNh1+m96T8qzyq
 4dXD/4siUPnnCXhFsmjoqRbjuRnA0vksn98yQGWysEfS/zuyHJ/j2nvsDgtA4p0Uk+
 aXmAr6+VAkYhRBKGMwFoZbffaKhAsR5hGlzQAZyE5n+4+POhnM08Gk6apNO7D7aVRP
 +KmuEPwNNQLujE24eT2vagiEMBqWA3tu3d8zmCpkl4z61/0b17ZwoNy12h6Jv7+mCZ
 FvSJeU1AcyNui7w2DJ6gyAL0dntf7XuTrPuHFcwKy1Gj2Zebuqkeze/APTUoM178wo
 qTsgQLVE/AABQ==
From: SeongJae Park <sj@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 2/2] Docs: Add some missing SPDX license identifiers of
 subsystem docs
Date: Mon, 16 Jan 2023 17:23:45 +0000
Message-Id: <20230116172345.12835-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_OUnkzoZcCdW0X-=gJsXSRgY=GLrbmfNj0geDCzL5a7eQ@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 SeongJae Park <sj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Jean Delvare <jdelvare@suse.com>,
 linux-crypto@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Sun, 15 Jan 2023 10:35:57 -0500 Alex Deucher <alexdeucher@gmail.com> wrote:

> On Sat, Jan 14, 2023 at 2:48 PM SeongJae Park <sj@kernel.org> wrote:
> >
> > Some subsystem documents are missing SPDX license identifiers.  Add
> > those.
> 
> It would be good to split this up per subsystem.

Thank you for the comment, will do so in next spin.


Thanks,
SJ

[...]
