Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68F811611
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DAF10E764;
	Wed, 13 Dec 2023 15:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A09C10E764
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B513DCE1F69;
 Wed, 13 Dec 2023 15:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F2AC433C8;
 Wed, 13 Dec 2023 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480952;
 bh=BOQd2PqXMpAxHexTtrg3Hc/jZKTRaDU86+Gy/WOQqb0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eiAaLRm5mrz59icZnSi+8PFM6WxsVnO8pdVog6uGR4xoRDslpVCu34yYlSUuXiAmP
 ioAypIeUWEjoWmnn0FbvxS06sEtNlQKTjv5CKwNzC9uXmyhnHaLWhFeSVWETu73G2Y
 JZJosbMaloJjyhbRCOm4tjN1XAVhSpGDZQgVubXfK6dRz5kxyNCHSbBUj0LrnNQeOZ
 RwWQJV+kLbPm6qjtDD2zov+a0MHKfOZfVjKhtbfId+6p85QniyLs9qyYmTRlQmKaO3
 onlNOj41WsCf5YhQH9E8ENE2EDEJlL/X9UU4WxpyTryzzgLhNh70QvvG/pOeemwv4b
 ik7UYKVHcefTg==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231213112401.2000837-1-dario.binacchi@amarulasolutions.com>
References: <20231213112401.2000837-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [linux-next:master] drm/panel: ilitek-ili9805: adjust
 the includes
Message-Id: <170248094841.191897.812940290291965613.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, sam@ravnborg.org,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 12:24:01 +0100, Dario Binacchi wrote:
> Adjust the includes to explicitly include the correct headers.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

