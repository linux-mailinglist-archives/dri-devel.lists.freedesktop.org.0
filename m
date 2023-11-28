Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2677FBED8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 17:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4603510E0B4;
	Tue, 28 Nov 2023 16:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176ED10E589
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:03:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3DC61B83983;
 Tue, 28 Nov 2023 16:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837ABC433C9;
 Tue, 28 Nov 2023 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701187431;
 bh=+pato+LffL0P+vw0mTjTTPCUEE3imABiIUqXTtcAvp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ND7N4ysP/c6pHxK6EgD0UorMDPSQIBULubLzj+4yb56G042te3HoTCFbid9l/TNkl
 n5/4PUMMqlL5K9VVTz8hDyuwCOh5xxaZ0VICQOiM9mhWW9scUNHRrCfcNL/FiHsfDN
 0bKA0F9cjzqEVxEgSh5QCbAOFHsVCpXwcvhGWxW+VPHl4HBrF+WpHBP0PUrbzmjPog
 TLrByMin8bewXrWRB09zdyDoPIQRx9fvW1TF5RfLF774+6hjuQt4YHxHlp6aX0i9/G
 wpoiM/cTUEsGGAjGBiH+mau5rSsuWvnuNjnEtod7IDseYg/NAala5A2EMuJVMqnGfh
 AurHUWPD0q+0w==
From: Robert Foss <rfoss@kernel.org>
To: linux-kernel@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] drm/bridge: Fix typo in post_disable() description
Date: Tue, 28 Nov 2023 17:03:44 +0100
Message-ID: <170118741506.1051024.17483818104518491512.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124094253.658064-1-dario.binacchi@amarulasolutions.com>
References: <20231124094253.658064-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Nov 2023 10:42:30 +0100, Dario Binacchi wrote:
> s/singals/signals/
> 
> 

Applied, thanks!

[1/1] drm/bridge: Fix typo in post_disable() description
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=288b039db225



Rob

