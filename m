Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE003F3E4C
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 09:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2736E05D;
	Sun, 22 Aug 2021 07:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3930B6E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 07:37:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F265661266
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 07:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629617857;
 bh=qIdXnP6W6YhI3v2z/hbARLRLquO99Hg2ARJElnNfsXc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pqGMfCHb2VE42kdOrZrjRak80KUJkqftOgwYzLmcB014l6h6LmqbbeTsCzNq513xs
 V5kejiCaQIRTorVkZqRHOJagibvwmIgeH/qHrrqQXSBxML7bddRE1lfZfjJVys76DG
 1eUKLj8e5knpnAngvWKy5qvZQCeQzURDWjvNu92vFFMTO130ZkEZQbHXalrfJHAZYo
 TS99eJXZaQ7HaeTDabogPuL23vt44KTRE1xkwhedurZDMzlyoeZG0guH5JYgyao7jb
 HQj7FwU76lJJ3cwrvLz3e43XD/jKNjrK8Ug4WIi1H/wmYc2C3xJEd57e0kWWgZrjxn
 GQKnJAmCSbO4A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EA06560F94; Sun, 22 Aug 2021 07:37:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204849] amdgpu (RX560X) traceboot in dmesg boot output, system
 instability
Date: Sun, 22 Aug 2021 07:37:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: justin@postgresql.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204849-2300-8wXbBYaqel@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204849-2300@https.bugzilla.kernel.org/>
References: <bug-204849-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204849

Justin Clift (justin@postgresql.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #4 from Justin Clift (justin@postgresql.org) ---
Clearly no-one is ever going to look at this, so I'm just going to close it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
