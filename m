Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F317E2460
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE28810E314;
	Mon,  6 Nov 2023 13:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8A710E314;
 Mon,  6 Nov 2023 13:21:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D9D760E17;
 Mon,  6 Nov 2023 13:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3503C433C7;
 Mon,  6 Nov 2023 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699276870;
 bh=7Rrue7iWo7xWOE5v3jmblFvIZlUbm342f9COKV0+8nA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=P8oKSHEFiUaILzU/Mh2+xyABysGTDT8YUVkOOlcpRhIDNLiIz3d4UJj3NeFBRrirx
 PYXtUMxXoJcxP2aTBNYkGkBuuzFak3FrzXq42qiSDzM11FGmxLo/Qs4/Lhy8hY9/0r
 35X7Yut/4HG5w9x1G2KauU7xy99tbU9WfwYrIdSAifMdWHP/au576J+x15LW9cG620
 CckZwVBCRs2eXUU2rNirDu7OiJ3TGh5IupTZX1nOgrccLOtmXdTh6LJVoCxHo2yJSq
 ulFzBivMS8znzBJl5aV+rxHgY9ZFn0tqo6OfkawlWmjHtiQtvxOp6RgvV10G7rmxjt
 SzEWgCDy8RlWA==
Message-ID: <87b4456213b2d4bc3bfa312e28f946ca.mripard@kernel.org>
Date: Mon, 06 Nov 2023 13:21:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/gpuvm: Fix deprecated license identifier
In-Reply-To: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
References: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: Maxime
 Ripard <mripard@kernel.org>, David Edelsohn <dje.gcc@gmail.com>, Danilo
 Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Nov 2023 12:48:27 +0100, Thomas Hellstr=C3=B6m wrote:
> "GPL-2.0-only" in the license header was incorrectly changed to the
> now deprecated "GPL-2.0". Fix.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
