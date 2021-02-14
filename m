Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E731B2C8
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 22:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026D56E09A;
	Sun, 14 Feb 2021 21:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8F76E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:34:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9956A64E29
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613338475;
 bh=2PWmkgqfT1YxA1xs70gUwWuqza790qA+bPo/ceFf1vE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aDPE5agvGtlcWXw+Rv17lqr0nRumS4NtUNJASobBB8ERApMz4hydDwQyQbrulJBvp
 TpBvU2dvrza7VqCMuv7w46MBi3UHYb0DKuRgBf6qquMxIJ7HtaW7ueC6C6lA2SF6YC
 2QfE3QzTY/rn3GZB3FZbAybQb4eSEs9tC7eQuAjIPcYgENTZKv4VXRVNOTwGNzj6rp
 ZkkQIi5cfYWy12PvwY5K32SMNxswDcpur85y74Qi+nF1g3mI2iF9BfaH5QMilQzwTg
 WA7Jn/nCvTyAvspKi4AJsQyHeRThnI0lyXo8fDfLIgJ1JjxNUrqtmGpMylgt8bDp+1
 Ypvr+92f8ncCw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 962B365374; Sun, 14 Feb 2021 21:34:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211745] Latest 5.11 git doesn't boot.
Date: Sun, 14 Feb 2021 21:34:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rmuncrief@humanavance.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211745-2300-a2nTEkLIYd@https.bugzilla.kernel.org/>
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

--- Comment #1 from Robert M. Muncrief (rmuncrief@humanavance.com) ---
Created attachment 295273
  --> https://bugzilla.kernel.org/attachment.cgi?id=295273&action=edit
Good Xorg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
