Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7977FC96
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 19:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084AD10E51A;
	Thu, 17 Aug 2023 17:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09BB10E51A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 17:09:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 694FD675BB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 17:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21547C433CA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692292182;
 bh=Bfbk8UDpudcRrwgjpkQcWhjU6b/bL1C4g2s6yh9FKro=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GKYkkmLzN8RQFJvp8/KvUAxsQt4EeeXXSLup0zi7kv7yhoGjvL01K6I/L6NaVyD5a
 wwxHN9FRwrMtaZ6U6Mgi7q6eULd5zgFFZzn3F0ytMZom2HBYJob1XCvPFkHTqzIeG0
 LcBJkecz4TDooGI89tzllo15OmC5CdOFCALwrUBE93eJkUhHe0/3BiCMZhUyax3jlO
 Jia7T1DLb6alIf0YYjO5kU7ywDYnBEk02LR+0KRSU3MXmC7jsB0ijgDbk+OdqHHAr2
 OEWHcJvu020jUmvC4eyHa6y02vUf0mlw9Df+B5OQCzLxHKvhrTCF6/51uPTcd66R/h
 TzXhKZGfh3vUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0E9B1C53BC6; Thu, 17 Aug 2023 17:09:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Thu, 17 Aug 2023 17:09:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-ZWscuJFhlR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #17 from Alex Deucher (alexdeucher@gmail.com) ---
*blacklisted

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
