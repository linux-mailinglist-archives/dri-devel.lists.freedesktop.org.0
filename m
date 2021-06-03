Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2051399A96
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 08:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7B36E51A;
	Thu,  3 Jun 2021 06:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587EE6E51A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:24:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09EB561090
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622701441;
 bh=hrHObyIq/rUU+1i04EO8XmWD5sm+mX9ksVh4nofs/Qk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ICofxE3kimGCat5vfiz/ttXHZBxX9qHCnTtZbG2TeFUc/E6Zs8LvDVYGTG3XXbym+
 3nzwDNXwpyvcLibtuAmY26RqermsPmJDH+6OxscCs81MBlsciPZFEMFNPg1l3L27mB
 4gWfxdrW7pF1qlHFcAaMtEuc66UH+PxjaR7STxDTjfiUDnI78pG30/fXjSHxYx9dKj
 0i7DGFctgl64JZBiyxmIUWj/BuvAvzE5pDgjImRJ4gMKb77zpNkfCoOpsUWSSY2QD9
 BR/aCV26nUCidTVS6eeD3sN1RC0vEsrnjb7QEC2hgjRzJV3rFiJnJHn+h6iejYUEzZ
 4QV5v8fNhTyNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0302761206; Thu,  3 Jun 2021 06:24:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213321] Laptop not waking from sleep
Date: Thu, 03 Jun 2021 06:24:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sujay1844@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213321-2300-M8tHPXt1lQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213321-2300@https.bugzilla.kernel.org/>
References: <bug-213321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213321

--- Comment #2 from Sujay1844 (sujay1844@protonmail.com) ---
Created attachment 297127
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297127&action=3Dedit
Dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
