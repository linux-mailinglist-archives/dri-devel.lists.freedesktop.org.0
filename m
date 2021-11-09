Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BB44A7EC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 08:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C006E03C;
	Tue,  9 Nov 2021 07:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4086E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 07:55:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 804EF610C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636444500;
 bh=4t62RikD6bR1CzF3P3YgXx7ecS4JAIS6XTWnyE81q9w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rd4tbPBFA58muwhMnggtmls5loU+ghSbIO2NgBTz7SMqV++DA//rrOkfo2duvQGVi
 /eB+hXFStoEpFBFaoKgjo5RixsFXLMCT/TDKPHx6woGflon/jTVS2yaWkwyPWi6o5K
 t9H5r+LmBc2wDhze/VJiJSXhRk78/CUT+UI6ECRzSBRBwdvntu9VX7+aGvv1akV4yd
 tmRz+lsVwwxNEHTwfTsIzOIe9/+8qYoPxZEDMYOyO3uyBUaDDqUWSDTEylMXcjbMYC
 Md63wUe9COYAea7tfWHdWH5h3Q7hXH4BEWZ/Tdk3/XNkl2rEyNHoeywexK4bDeDiYA
 kJhKqIFnQUqOw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7C23861004; Tue,  9 Nov 2021 07:55:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214725] simpledrm and i915 both active after boot
Date: Tue, 09 Nov 2021 07:55:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jani.nikula@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214725-2300-xoTM61zWk6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214725-2300@https.bugzilla.kernel.org/>
References: <bug-214725-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214725

Jani Nikula (jani.nikula@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Jani Nikula (jani.nikula@intel.com) ---
Please file drm/i915 bugs at freedesktop.org gitlab.

https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
