Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D8F80C578
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 11:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB6810E394;
	Mon, 11 Dec 2023 10:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F69A10E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 10:02:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C9EACB80D25
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 10:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E057C433C7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702288955;
 bh=4bf3gOiRie5eowlrrG6R8gJGxuZ/Y423qC4hpWCQFG8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=inlcdHQ4eO4IIaiJo7icttt4RKOu/8u/IxXpHmPvuXaSvzAZ5get/3krGoLV94DfQ
 Pk84545vLDPNeY2asOM6pr0nSYNGfvqEWcBd2OsVt3AskwuoqE/Arfry8CVwlRjPjI
 qzgdbt/UDZ9X3oNQaS99yFMH2UIHUI2h+MDmTzsviea8uREPm5p8v2EkjUY4Y5YmAQ
 zFzIdHLSijjNRAMtK1r3UhDxygj4Z9oeeNQLz/h1vmciV4HM5iqBESnZPfC5eBOisn
 JP9sAHkUhpjXy/00qXcW9r+TTdVGbZeNd+6k27K7eG2ngTG/gJOliJG38xlO7bgVKv
 U2b+aMwgEJLfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1ED9EC53BD1; Mon, 11 Dec 2023 10:02:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218250] Regression nouveau driver
Date: Mon, 11 Dec 2023 10:02:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218250-2300-znfMywKhE2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218250-2300@https.bugzilla.kernel.org/>
References: <bug-218250-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218250

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/nouveau/-/issues/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
