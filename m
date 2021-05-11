Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33B379B03
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 02:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECC96E97C;
	Tue, 11 May 2021 00:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64886E97C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 00:03:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 845416161C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 00:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620691395;
 bh=oZQnwKb9Ccmmc6dFt0x3nAWRCKLkqNMboKwh9YbBCLQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DuMuL4IdKTpWKObQSCIws3FqfDA7/a6oHxfopS6zCF/GwHpXcgScuX3Rjxccn4F8/
 Ts/pfHq+bJoYizD8CVT12nU9UTUZdMpgoGW0qs/LBkntN8RV+NzPc93hbYChNkrhxl
 DdQaBF2W8/Goh1trs8UDxI26o3aIsFZu248ueQMkRR0RzdldFx156cIOkkxNHfhILF
 6OV6ZhRf+/bbdu2Hs2WAJRZdCSsoA9Li/f2nRP2/EQCVEY5hXAxlbAGh3cbem4qzxX
 mDzFJ2M5Fl4YlqLi2yZMpNFpNWBvHXEkzmARCuZHjnyrjGoGHpEHWixXNmuSLBpv4v
 z+gkdHKidEvZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7BEB36120C; Tue, 11 May 2021 00:03:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212959] [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR* Failed
 to find connector for link! - Exclusively an issue by booting from mounted
 ISOs of respective OS.
Date: Tue, 11 May 2021 00:03:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tob88570@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-212959-2300-4XBob2kwKi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212959-2300@https.bugzilla.kernel.org/>
References: <bug-212959-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212959

tob88570@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[drm:dm_helpers_dp_write_dp |[drm:dm_helpers_dp_write_dp
                   |cd [amdgpu]] *ERROR* Failed |cd [amdgpu]] *ERROR* Failed
                   |to find connector for link! |to find connector for link!
                   |                            |- Exclusively an issue by
                   |                            |booting from mounted ISOs
                   |                            |of respective OS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
