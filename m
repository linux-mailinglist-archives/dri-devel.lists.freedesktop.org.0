Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A423B3B05C8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3647D6E505;
	Tue, 22 Jun 2021 13:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE606E520
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:25:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FA046112D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624368346;
 bh=TM/ddZmHQLKIBezf3jpqN2WmCnY/b3UtfRqjH73KilM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u4dL+tF86HF90i1yqb8rUnyPg5tYgDvT7jzRpEJnkyPd2Z8NdsBJht6+3nz/jP9Hp
 ydfJVEuDKvElHOgd7TFW9NQElqOKcjrmw1fkC7APdJk8Kl5mo+BhgrAOW1aECiDv5c
 shu+DCG6XXo4G9aeBSqtuPC5m5XDzDNXkoJLjmtONxbj2iZD1uOpvV8fQsJPnmywrz
 7PNKdIdGu73w7zoXgxTwHmX81utufU01NIINfQBD7utzCetxO0+pYICklyZgJRYtm6
 EgbkdEmujYve9/0WAarX+L4x4/ZB0fzEGyXro3c1UceL8UtCgRaFJ6uwnEKNSW5PKW
 03hMJgzivfdiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3C4FE61278; Tue, 22 Jun 2021 13:25:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212327] i915 / Kernel Mode Setting - Distorts Screen
Date: Tue, 22 Jun 2021 13:25:46 +0000
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
Message-ID: <bug-212327-2300-tcbsZbtp95@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212327-2300@https.bugzilla.kernel.org/>
References: <bug-212327-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212327

Jani Nikula (jani.nikula@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Jani Nikula (jani.nikula@intel.com) ---
Please file drm/i915 bugs at
https://gitlab.freedesktop.org/drm/intel/issues/new

See also https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bu=
gs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
