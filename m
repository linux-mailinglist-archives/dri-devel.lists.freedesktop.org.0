Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF579C42D2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 17:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E0710E12B;
	Mon, 11 Nov 2024 16:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JJ1qYURT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5342310E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 16:42:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B86DEA4011B;
 Mon, 11 Nov 2024 16:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D992C4CECF;
 Mon, 11 Nov 2024 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731343338;
 bh=bMvBiLBnkjt3874HBhx/ZepwiWrsNm8t1pyp0Dzw9vM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JJ1qYURT4/USA0qQ9SPzD1Jr6mPgThmCVBYRsVQkC+T8zvX2AEVJQB5XzdYoC1XFG
 I+Dv8zHL06ZiptgznmMxJ3AnB816j262Q2rkV1CpixB3zpyg30iyHVZVlXAe7wmmJ7
 S38ixJcz8/lJq1/I0KakQD+WUAQ64bfs4CenYVbmiPl33VLjWN8qxgfRx9gsR5bjkE
 egwiaXIwMM0ap9ZBXNNHfrPdhhRFwSwa3GOnxPwLuIjeNy+Vg8jJhmP3hmYDtbL1k9
 /ZoLUzZXT6R/ldYELGUut2hsxctZp0s+tpzfAJfbiinTydLaZ5TLkW0Ocq1kedle+T
 +TVDiRXNCWMxQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
In-Reply-To: <20241108-new-maintainer-address-2-v1-1-47c9d71aac11@linaro.org>
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
 <20241108-new-maintainer-address-2-v1-1-47c9d71aac11@linaro.org>
Subject: Re: (subset) [PATCH 1/2] MAINTAINERS: Use Daniel Thompson's korg
 address for backlight work
Message-Id: <173134333678.299614.17079258343612609351.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 16:42:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Fri, 08 Nov 2024 08:30:44 +0000, Daniel Thompson wrote:
> Going forward, I'll be using my kernel.org address for upstream work.
> 
> 

Applied, thanks!

[1/2] MAINTAINERS: Use Daniel Thompson's korg address for backlight work
      commit: 3adec6f907b698b32ab62f70da31b41abed00c59

--
Lee Jones [李琼斯]

