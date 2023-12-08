Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D526C809DCF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A9310E9D7;
	Fri,  8 Dec 2023 08:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBFA10E9D7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 08:01:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C03A6CE21DF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 08:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E588C433CC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702022457;
 bh=bGNt5SCouPABi5Lc591zkd1XQ3UUWeqTDk8TwSmJo6Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H4TQ55TNhRNUSP3RxVSl/piid/pmtemSf+g2E1oH5ZZYd3HYaWeCKp0ZfpZRwasCC
 Vlr9OWsLZWF/YrWXTVV7tz9lolWvVGBm8ludcSlH82gYqcod/HkAfxFR4cKGGu8uMq
 2xqCbQUZeEQSReNWkjn9v/GkGHytIYvxEkGVfKfr0LzHOQTU4YNmcYV3KBUD8NioUA
 kSfPlc3h/BdNaIvbAaymV4sTYWZQdfqASQZ8J6J7I3aW5MSnIzvDQEqfzE1+dkTWYz
 jjkgtwZXyKyZzXcQ799QERc1dUKA9/dDV/TqiUKOay4fKU2repMRzc/mmLoc7JMh07
 gUybASAPNPobw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F0671C53BD0; Fri,  8 Dec 2023 08:00:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209129] HW related error message under Gnome important tab
Date: Fri, 08 Dec 2023 08:00:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: imwellcushtymelike@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209129-2300-JmKIgJztmx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209129-2300@https.bugzilla.kernel.org/>
References: <bug-209129-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209129

Ken Sharp (imwellcushtymelike@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |imwellcushtymelike@gmail.co
                   |                            |m

--- Comment #15 from Ken Sharp (imwellcushtymelike@gmail.com) ---
I've opened a bug report at Launchpad for this but cannot say for certain t=
here
is a kernel bug here.

https://bugs.launchpad.net/ubuntu/+source/linux-signed-hwe-6.2/+bug/2045951

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
