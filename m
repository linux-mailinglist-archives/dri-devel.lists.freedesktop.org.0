Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3950C540E3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 20:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3F10E1C7;
	Wed, 12 Nov 2025 19:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PWj4QDuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7646710E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 19:04:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1514343748;
 Wed, 12 Nov 2025 19:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE58EC4CEF7;
 Wed, 12 Nov 2025 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1762974260;
 bh=846hT+dGW211Y97I4IbWEBRKXNXlQZwQ9OpEY18U14Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PWj4QDuHQQgsViPtOYCFo6E5vmELiJv9x6n+wYyYbfFHlfQJFhG+EYSrNdsMG2GDi
 Qhx5UbFl+KSJoyIW6OdH9919yhJngw2TGV2yUviea2XAyi6L9Nydo+/cW73Cddgtbe
 lcOMh87/sbxZRNdGl+m9hdzq3xJlgs5shY2+R1No=
Date: Wed, 12 Nov 2025 11:04:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Gustavo Padovan <gfpadovan@gmail.com>
Cc: linux-kernel@vger.kernel.org, gustavo@padovan.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org
Subject: Re: [PATCH] MAINTAINERS: remove myself from sync framework
Message-Id: <20251112110419.59be3dbb1bb297ef18ed9739@linux-foundation.org>
In-Reply-To: <20251112134330.64130-1-gustavo.padovan@collabora.com>
References: <20251112134330.64130-1-gustavo.padovan@collabora.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 12 Nov 2025 10:43:30 -0300 Gustavo Padovan <gfpadovan@gmail.com> wrote:

> From: Gustavo Padovan <gustavo@padovan.org>
> 
> I haven't been involved in the work anymore for some time.
> It is only fair that I remove myself from it and let other
> continue to take care of it.
> 

Thanks.  You could add an entry in CREDITS, if so inclined.
