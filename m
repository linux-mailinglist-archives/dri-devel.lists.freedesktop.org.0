Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FC3FA70E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 19:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB876E0A8;
	Sat, 28 Aug 2021 17:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4476E0A8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 17:48:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DC35B60E90
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630172893;
 bh=2hjbgqLSw8C4wk1ge4LQLUD8dTyZR1Sk5+YjC/fUw2E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lm0Ux9q4isvfA5Qamf+fmzCx/WNlWodZldN8i3Y5WuRNbryVn5v+T2Es2yiiOOGkS
 0kyQuZ92QXMBcTJy0eaWyYsPs91psOtFG6oEh/edzJuHMhequllkQUxgqLgIKNVDqx
 VwnQPfURjWtWienZ7+z+y5pRSd2T85YZcn669AfZNpDZPSvbmqcemxQJ2K3i9sFDBy
 iR6ZldQianyWwGmQPANP2OAiNkTI0a5HPsc6sHo2KyaLdZtreYBEAD0y463XBqdCzA
 Zvmu7XKbxPxGCxbsx9AabrI7mC86iSYlwni0xjJT/SYknFZ3WGIYnyOy0vtIutXkuQ
 8ces4V+LtqgjQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D469A60EE5; Sat, 28 Aug 2021 17:48:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Sat, 28 Aug 2021 17:48:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: velemas@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214197-2300-t8G05sptEG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

--- Comment #3 from velemas@gmail.com ---
Created attachment 298505
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298505&action=3Dedit
full dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
