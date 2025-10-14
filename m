Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF5BDA7C4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8C510E647;
	Tue, 14 Oct 2025 15:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eECGLpat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D231010E647
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:51:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 627684553E;
 Tue, 14 Oct 2025 15:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD4DC4CEE7;
 Tue, 14 Oct 2025 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760457080;
 bh=zOZDH77bn1gquIeox//qKPxU90cY4Ij04lXUUP+LE0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eECGLpatW5IS3B/Y+Ti0pwcE0YTu5IH8fJQtmapIaeTt0F0CwLE6bf2l0XxDo5kFN
 eKfNt/8Y5Hew5Y/3fILpKigwXkiAzr9aNRkK17IufNGPHpM4euHcNv68iyC0oHoCKX
 CXnhonzmMPPt1fCmlExPsSzgwWEJcqxMbMNwXPaWWwvGpASL0pzWnV+HXwSaz7jQwN
 U8wp1gsNf5IpDPdNPS5euLopXuXV75AMWbP16Ms9Z734tIXlY9ejX0zRRK+zz2cruS
 qdnvOSYRzOdDeWzTUhLKFvk1tPhXaHPuGlTUr6zwC+xCNLyOz90WZnL7Obu5SgDmWQ
 OpEV+8U1YJ3pg==
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself for sun4i DRM driver
Date: Tue, 14 Oct 2025 17:51:15 +0200
Message-ID: <176045707075.619524.5538988526351452009.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014093628.564265-1-mripard@kernel.org>
References: <20251014093628.564265-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Oct 2025 11:36:28 +0200, Maxime Ripard wrote:
> I haven't been involved with the driver for a while. Let's reflect that.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
