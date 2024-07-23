Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2870939820
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 04:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DE010E1A6;
	Tue, 23 Jul 2024 02:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jsDyl6Ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032910E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 02:06:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7ACBBCE0D24
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 02:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0CD6C4AF12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 02:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721700379;
 bh=XN++xLCvUyZO7myBkQtk4WPye1o9HOgt+9rxC7Kr6F4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jsDyl6OkUmWMMDp49Oi0zds+zgt9hEAT8eRuvCcbMvODaHEVop9sMqHks9/F7EVCD
 qFmFTA5fnV0JR3fiN+O7UQKUql4lRZqZAPoYsgrK1ob3i5eGrQaTqjOIMoYPcuyxx5
 N0GqlxZQSzdy6Py3+dLDUUoThHtF4aBHTHADG/NGjUJLvwsInexg0967ByuyfzxuUo
 yEW06xe+kkjrF7wXH+knY/+da8dnhcr6jiCFTSnUadUFZafooU8KSApwJKHTwFD+ll
 +K26+rkjomlUWt+5WONYCjEQi8WTDjiTsQZJaMprEKRcHG2JSdpekBlgNFzru2J43P
 YSEF1nvCSHj2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B6B9FC53BB9; Tue, 23 Jul 2024 02:06:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 23 Jul 2024 02:06:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: fararejanna@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-DYIWXCUf0c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

getcrarea (fararejanna@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fararejanna@gmail.com

--- Comment #27 from getcrarea (fararejanna@gmail.com) ---
Games often involve setting goals https://snakeio.org working towards them,
which can help players develop perseverance and determination.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
