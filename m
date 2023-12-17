Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC7817AD2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2C10E40E;
	Mon, 18 Dec 2023 19:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067910E435
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:16:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C765CB80990
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 15:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AB2EC433CA
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702827729;
 bh=InVa/giuHLnU6rN3qCqmu8mpsADwnU7Y3iSyBVCBRHM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OJx6dgAN3r9OFethkHUZrWdLN6xwZRagnsrU8ubHftLGnvZgbjkhFJHqhGDDfYHU6
 JmW63AvhegL6Eo+J7U0Zqaqvpir+HyYa1CEk5PHbF/DfVvTst3SCQx4Z7qyS+lCMTs
 Es/v9w84IG+bpwYAUB3xkmBHDNQu9cWSYC8WOZQkoXdYgV22NKbgTUPUUocBxTFzHZ
 CV0Z1D/+zXQbAkqWVDpEytzr0LEAfKjvMZ6jQzG/UJHNaAx7zI9LTVgaW2j8oJhY42
 DSl+piCZylGOnDpqBePeVDsHT5HkuMcDqXOmSGBf8TtHpFHxFxwXebyQsJWcP3jhtB
 ix9q245xQPLjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1B6C3C53BD0; Sun, 17 Dec 2023 15:42:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218274] AMD r9 m380, 2015,27 imac - amdgpu wont work
Date: Sun, 17 Dec 2023 15:42:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-218274-2300-C9vHvrme22@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218274-2300@https.bugzilla.kernel.org/>
References: <bug-218274-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218274

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |aros@gmx.com
         Resolution|---                         |ANSWERED

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here instead:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
