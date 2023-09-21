Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60B7A9445
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 14:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C579110E5E8;
	Thu, 21 Sep 2023 12:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAF110E5E8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:26:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A86FFB82032;
 Thu, 21 Sep 2023 12:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1249AC4E67D;
 Thu, 21 Sep 2023 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695299185;
 bh=6hbfjyAIxE4EzSgpold1rqF/EV+XMueK8W70udkgYAs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KSY6o5q+ERPgqULRfXS3dx9Mr/DQGgxLvsXrnVzC2roW3PRMYiTBuH7Ya0UA0aFIq
 6p3xKLfdT68pZ302oMJEr5YWQkAmCIg/glj1sqoOcfQVt0OqoFpouG57Dj7xI2jzBZ
 r/DcK+x1rv8baSdVYn9DlX3J23j7UTLS2Nld2eMH3prbqOalFbykIxAhl+36hX6+xU
 qPxhHJKdxNe6oiwPjwfNKQXWcTo4NBiWog+OAXbSvL/5KaB1ajI+Vy4kzupv/1d9NQ
 8BTXLEzixat0vJIq7ywDKJcOSKk+dhiswjQt3/YTwwZtGaaK9J3WZK8scE8upvNLW7
 knIVuViPUU0eg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20230921110038.2613604-1-mripard@kernel.org>
References: <20230921110038.2613604-1-mripard@kernel.org>
Subject: Re: (subset) [PATCH] MAINTAINERS: Update gma500 git repo
Message-Id: <169529918297.2677745.17153597323233608988.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 14:26:22 +0200
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023 13:00:38 +0200, Maxime Ripard wrote:
> The GMA500 driver has been handled through drm-misc for a while but the
> git repo hasn't been updated. Make sure it points to the right place.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

