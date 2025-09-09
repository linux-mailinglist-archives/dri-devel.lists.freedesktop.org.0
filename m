Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E75B4FACC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 14:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D6410E6EA;
	Tue,  9 Sep 2025 12:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D4N9i7iP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22C010E24D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 12:27:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F97240C1D;
 Tue,  9 Sep 2025 12:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B89C4CEF4;
 Tue,  9 Sep 2025 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757420829;
 bh=tnCyHd5iOnEm6JgLOIQb4zwexW3RJUgLWmqKBnJiOYA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=D4N9i7iPl7OPPtd4oOF4Y96Gkboph2gL2H4bY0bnESgA38+sEBLpLCRpcmQEESqks
 +2D9ycQLHxf9KCXm1atgul3HopdwnJift6Y44OUqkfWqWzqEt08s4X2HWtqdEiKdlC
 cCAzm2FQNVt9ORXFRRsAdmB9CI3Dqq0fBTF1Um4UcrVgmwphR39F1sp3KPcwn7w1N5
 2+0AcCPnU3lVOghf8CFgaTwhMCOdIltWKwN4F4cM7JzJNRC+nekUEVwuYOayWobo3r
 0TuGKssUiYw/OnXYNsSy8yUFzy2SwxhF6Z7kjdCKW/xaYI8igBx7BgmhJbx4KtR3Zb
 L4pa/gYbxHygw==
Message-ID: <71083284f4405a6d4a74c891b47c0800@kernel.org>
Date: Tue, 09 Sep 2025 12:27:06 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: drm-rust: add drm-misc maintainers as
 reviewers
In-Reply-To: <20250904144614.6406-1-dakr@kernel.org>
References: <20250904144614.6406-1-dakr@kernel.org>
Cc: airlied@gmail.com, aliceryhl@google.com, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, "Maxime Ripard" <mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Sep 2025 16:45:50 +0200, Danilo Krummrich wrote:
> As suggested by Maxime, add the drm-misc maintainers as reviewers to the
> drm-rust entry.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
