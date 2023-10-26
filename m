Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC497D860F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 17:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D824310E83E;
	Thu, 26 Oct 2023 15:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3223810E83C;
 Thu, 26 Oct 2023 15:34:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A4356352C;
 Thu, 26 Oct 2023 15:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77398C433C7;
 Thu, 26 Oct 2023 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698334450;
 bh=WlnOzBHEslW7auiw0OQwFlM3UIEQxiB3h6xa2FYhXD8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XDLhyice58rh/uUv7OvhKCFL0YqZ96mVJJZ7ryrPkBzgCe8Ckc1dwVkcFt8MINDR2
 a8fBohwsAijNXq25EoUNELjMZrV2J5pcuieu1UWPzLVCSoxLWmwYizVsyoWNjWikow
 UgA+lVYBoRj0AcknN1FHOgwkZZUfMHKAhVPW6Rrjo7vZC921i51E6IlnSVqLzgiTVU
 VG8ZuE9kJ5iEjm+HFcgv32oTcM4g3Gu37v7uGiz/ca0shJzGuRpbaQskQ12sT/xv7L
 8fYF2FDSvPane+sX5uC0e3+YrQSiI0O/Py4r/GU8E5zhE9Wpoqgbex9RfodWfBTGV8
 42xuzs5WEvfsg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230919182249.153499-1-helen.koike@collabora.com>
References: <20230919182249.153499-1-helen.koike@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: drm/ci: add entries for xfail files
Message-Id: <169833444817.1001410.15120310571741480170.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 17:34:08 +0200
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
Cc: neil.armstrong@linaro.org, michel.daenzer@mailbox.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, airlied@redhat.com, alexander.deucher@amd.com,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Sep 2023 15:22:49 -0300, Helen Koike wrote:
> DRM CI keeps track of which tests are failing, flaking or being skipped
> by the ci in the expectations files. Add entries for those files to the
> corresponding driver maintainer, so they can be notified when they
> change.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

