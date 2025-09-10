Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C152EB52042
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 20:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEE310E9B3;
	Wed, 10 Sep 2025 18:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="st03e5MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6947B10E9B3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:29:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 167E64469A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8EC1C4CEF0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757528957;
 bh=lAaqCgdGNSCB3AV/K22vR98KpsH7fzLZgtAvHdAO+fE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=st03e5MIOh7Mv8iO5RZeL6gFOsx/hFRDy4g4j1CENgwo2cgXnsmGU+4LlafoZVSOa
 YgS+K2qo/wtecsKjCDn0OEUM4NybSEoqmj7WhW3UknQ1a97Ynha8HJWa8Si0cm/276
 RzjXYbCUiftGP7rdfzqKQJamtOvl/s6AM1IE/fX4docnQgZEZjUSs5LWOr2JYCtA9k
 Nvamh5KOPZbTp8AIukWMN44zFKrmiu66d0T30Jc+iBN/fvv1uFamzUKbPnHdQPhI5c
 y+EWaiOBeNIu5haiOfBwOXK8W1z0T1TOQ+0jvN137w5aIB3Hh3NRLO7WpIZ7QrnBjO
 Y5Y8pfarUiptQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E0181C41614; Wed, 10 Sep 2025 18:29:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220554] Display powers off after every update.
Date: Wed, 10 Sep 2025 18:29:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220554-2300-1PZGokXili@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220554-2300@https.bugzilla.kernel.org/>
References: <bug-220554-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220554

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Indeed there's a DRM mailing list at dri-devel@lists.freedesktop.org

So, send your message over there please.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
