Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1377E5A29
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EC910E79F;
	Wed,  8 Nov 2023 15:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085A710E79F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:36:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49ECA615F7;
 Wed,  8 Nov 2023 15:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D095C433C9;
 Wed,  8 Nov 2023 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699457785;
 bh=ZNwyEHHUEwE32sPJEr2cy/zvLd4Oa0Y44mvEx4uVdC0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=N+C+Mm9DOvW41xQlHZ2TVmIysLX42LJ/xl/PTNFiruH2Wu4ATYa4k2Jmpv/MAIV0f
 JANa/WnumUmKQNSBxLJwIR9sUeFXiRNwMFy/HhmYIK1TQmfxq4MgfutVxD/BrUNpF2
 gdMutlmGlJ5GqOQ4+Hw72DgbNIdVOTpzsJ/k3wv9PeGVJSsfK9EeHuUEKr6yLBthag
 TARWGt52CUMc2URaFLJV1QXt8K3WE59YxhNHBAAE6F9EKHGmDggCNU0n9C6bb5PrWY
 Y0COjbc32pM1Stb6a/svq9+UnG+z+49ttg52dv9b22VQijktsXe7br3iblISUX57po
 53QHjv6k/7OcA==
Message-ID: <3fb0760a9066c33947b64ec415d9baea.mripard@kernel.org>
Date: Wed, 08 Nov 2023 15:36:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Hsin-Yi Wang" <hsinyi@chromium.org>
Subject: Re: [PATCH v6 3/5] drm/panel-edp: drm/panel-edp: Add several
 generic edp panels
In-Reply-To: <20231107204611.3082200-4-hsinyi@chromium.org>
References: <20231107204611.3082200-4-hsinyi@chromium.org>
Content-Transfer-Encoding: 7bit
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
Cc: Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 12:41:53 -0800, Hsin-Yi Wang wrote:
> Add a few generic edp panels used by mt8186 chromebooks.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
