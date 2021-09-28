Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9C41BA93
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 00:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153046E112;
	Tue, 28 Sep 2021 22:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4196E112
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 22:49:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7394961209
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632869395;
 bh=NL3gg8d3x34WQ5Rxg2gyHJCz8cwXP0uGGoHpnpArg5A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Aua/f/NPwvPLq3EwZHSjPJcYeZTcsW1/c/2clBXE+QBfSCpAYFJX0mK/D98skpYU/
 yuYWp+6xMOgTL6tre/3EBUnpyaeo1vJSYlZAO0niPxA4lC5ik8uhJBn4UOoIGhiaob
 /NgChYLwKEXLcVC8gjYLmJfxLHMWiG1ILw7SrkeTmbwNtiQoBrI6PLm6cPIIEuZibO
 miLK/O5EkNHgORk6hepdXfNcr1Ui5Cvkfak8a8TpnnAI09B2mrYonVQxtPDlDN4guh
 3AST1R3kqXhi5H0Do2fMC6tW3kK18wVHqaT6KtS38+fi3PJGd+xuxbpGl8v1LeSSP5
 R8XEjw5HnBywg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6832860F25; Tue, 28 Sep 2021 22:49:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 28 Sep 2021 22:49:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211875-2300-F2j8XRriOh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211875

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Sold the hardware, can no longer test nor reproduce.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
