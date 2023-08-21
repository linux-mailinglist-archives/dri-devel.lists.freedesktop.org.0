Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1B782509
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 10:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DD310E1FA;
	Mon, 21 Aug 2023 08:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53F10E1FA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 08:02:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5C47611E0;
 Mon, 21 Aug 2023 08:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB7FC433C8;
 Mon, 21 Aug 2023 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692604951;
 bh=wVawZypfbImK2Ibz+sdq6sPXO1RRKbl2Jin6gVIlzKc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vN7YioQ7a2kt0S5zUuk60M0n9nC0MLigmqZJzvnS5GURxtoF8Z+YDrMw8V5iGhO6P
 +sFPxGpKqxxFxGBpIIm3LNDtOItwXcHNQhrLtT2FowXQy/FljMB0R8CHI10EhNJdmo
 FqW3GD9Nl9KBbv+x4r5z3tBi5V0bpePHAnjtVMi4CYTFr8/dxkf4MIqhtGim3GtoZv
 JMGGRKZqrvv21e4+BDxx8oAMvkLqZh4gasZDHp76Bzbwhgr1Az8G5CrQBi20vj7uKm
 EXn2MQADQSsh0tF8sTAvpoK+OsAiQvGDRNI5vsQYOBO/vc1Zr68ZHMVIKJVrM2Qybz
 wT1UQlmZIkJsA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
In-Reply-To: <20230817094808.1.I41b04c3a8305c9f1c17af886c327941c5136ca3b@changeid>
References: <20230817094808.1.I41b04c3a8305c9f1c17af886c327941c5136ca3b@changeid>
Subject: Re: (subset) [PATCH] drm/bridge: Fix kernel-doc typo in desc of
 output_bus_cfg in drm_bridge_state
Message-Id: <169260494885.199179.14472084217400049781.b4-ty@kernel.org>
Date: Mon, 21 Aug 2023 10:02:28 +0200
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2023 09:48:09 -0700, Douglas Anderson wrote:
> There's an obvious copy-paste error in the description of
> output_bus_cfg. Fix it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

