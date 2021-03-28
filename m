Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB534BD20
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 18:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA90E6E0D8;
	Sun, 28 Mar 2021 16:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980116E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:03:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 73CFD6192F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616947426;
 bh=OSRVeNTUR2w+oAcJgN8P6USblJtz2HQ7NxksXVCs7AI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ViT561hfdAQv+tOjiU7xU5cUHs3f27pyF6Sjl7/ZZUQ65sUTj+a8otPNrOiErM70m
 gFZ+ZvwNemjhX6U6Y+HMsAaEDKGzyDh2H6aGbuybOGR3ug+7wfYfAG5gwOGvjs4/yJ
 Xtv1DEP4pfukpcotXN0XK3BGt0i04YdmjYaJxTDw5yGyXdpRb606BnRPzyJYEpiXkR
 +B7aaQ+vvb3BXAA8kvxscG/fpHaI73KWH8P3gDyxq4LfTx+CN9YqXwUFhiT0WlMPBc
 OUiej0ycEe8u3NlsE+7LT9IY5oA8yRrDXqQ996gC8K2xeqQulU6pMejQiyfHw8mNye
 X/h0iml3VhZJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6AE4C62AC4; Sun, 28 Mar 2021 16:03:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212467] AMDGPU -- amdgpu: Unsupported power profile mode 0 on
 RENOIR (AMD Ryzen 4600H, iGPU rev c7)
Date: Sun, 28 Mar 2021 16:03:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.pylypenko107@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-212467-2300-qjLdj1irKw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212467-2300@https.bugzilla.kernel.org/>
References: <bug-212467-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212467

Bogdan (bogdan.pylypenko107@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|AMDGPU -- amdgpu:           |AMDGPU -- amdgpu:
                   |Unsupported power profile   |Unsupported power profile
                   |mode 0 on RENOIR            |mode 0 on RENOIR (AMD Ryzen
                   |                            |4600H, iGPU rev c7)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
