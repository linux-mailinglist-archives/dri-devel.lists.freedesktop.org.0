Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA0B4AC92
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D8410E6D0;
	Tue,  9 Sep 2025 11:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Me3QKT+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D403F10E6D0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:45:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FCBC6021E;
 Tue,  9 Sep 2025 11:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1184C4CEF4;
 Tue,  9 Sep 2025 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757418327;
 bh=nEfKJaAGARXPvVWrRR/9nQEHjyYFIwQDlJDtGs6EbMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Me3QKT+vuPAOoQQ5oacKH42M69DrOS+Y7Gq7Ft7tCRRaxfNnJBYMiGTrwrd1hqnFN
 093DD7hOmNPkj2Lk78rB+Wrc/xzu0gdyMZD6wkZ1/9fxxvacZJPbfJHCPlAiEo6BZ9
 SVN+WQv5kvEOawd9kErSPuPy2Wnm4WlgTZfwtA9p9whic/sF1z4fJ9hrFJl1mSx4s7
 sAsjg7TBYJj74Hh8UvWpLZD4IxbOctZpNQJT5ztTSvvf393giaQ4j70u0TqCuSzvkU
 hBAg8vIwSBNe8UUZ80+e9Y2nMfk34WIwjujqAAz9lQZNS35s4xqxUWo5XaokwJ1duS
 sNzU0NlpGEncw==
Message-ID: <631405c2-f709-4472-9cdb-a51e421e6f68@kernel.org>
Date: Tue, 9 Sep 2025 13:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
To: Maxime Ripard <mripard@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 acourbot@nvidia.com, dri-devel@lists.freedesktop.org
References: <20250902190247.435340-1-dakr@kernel.org>
 <20250909-fragrant-chameleon-of-democracy-5be519@houat>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250909-fragrant-chameleon-of-democracy-5be519@houat>
Content-Type: text/plain; charset=UTF-8
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

On 9/9/25 1:43 PM, Maxime Ripard wrote:
> We should probably amend the nouveau entry to point to the drm-misc repo
> if it's the de-facto tree these days?
This already happened with a preceding patch before this one has been sent. :)
