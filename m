Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1531C2AC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 20:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B46E342;
	Mon, 15 Feb 2021 19:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56326E342
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 19:55:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8581564E1E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613418940;
 bh=Bz42HrUZimUGlJ9gHl1URaMhaULR7kFc56BUWBKd3yk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iHrNh3VgfDN1ASUmiHkmFsqLBvYP2PRCKHrd+KFmOF84OrJbO3MZ4lwVDA05xig8n
 Pj2u2zhH3f88WgiGEvOd8pKIwnV/zNmvBl4fJ84tkyzDajh7PCBuieTwz3Rf5Xh3cR
 ZZX1mgUMpOE/L4Un2bLQ6V8/tOUE4AkJkx/nqdB7mDvtc3+Js9O+UbhG+A9tyFAyoX
 TH/nU2JFGAqoL/00VZ9Uaf3uz2sA7GqHek7/J3Nh4Y1jcJ5IE8H+2k2kZRYrlU6V0f
 EPLau9DeeK2E7VS7QxdEIeexgRbqmSSH2QZkcORSiLD3lUB1zJjkGCR77ywU8ksoIt
 CGdwguvxjlpOw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 76039653BB; Mon, 15 Feb 2021 19:55:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211745] Latest 5.11 git doesn't boot.
Date: Mon, 15 Feb 2021 19:55:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211745-2300-c4G2XWOpgk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211745-2300@https.bugzilla.kernel.org/>
References: <bug-211745-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211745

Robert M. Muncrief (rmuncrief@humanavance.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #10 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
(In reply to Alex Deucher from comment #9)
> Only reporters can close kernel bugs.  Please close if this is not an issue.

I've closed it as invalid since I'm not sure what the issue was and there was
no specific code fix I'm aware of.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
