Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8A35F6F9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD106E91D;
	Wed, 14 Apr 2021 15:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487836E91D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:08:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EF350611B0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618412928;
 bh=1Q+zE3pjOPtRTG6a/wVGZVyz3CtBUeFeJtPoVgL5x9A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XwgAFpf/Re/o0zhCx0T9HGN1oatSBq4qYtPnrUbGD0WYK4uaGdg8vo4rKeUyx/etG
 oTW05SGqZpUIHeV4M/KmnyjKthtGx/Fo/R3H7j+EclzlGVe2lNmdtvH1YBVePx7ciN
 TFuvjEbroacUNfFIB7EyqMoJxDlLlg9ePFEUWEeQ0zhhPwVHK5BKo8x5y8wE13WkWM
 6wMNBMebRmT5bEKyYwcseCPNpSn8/828VO6TBy9cP5O2DNNBz8OFB+1VKgYZD2QbLa
 iQQFAsY4mYbhMsNE18fSYjcmmyl3NPuiKcuf36U6I5vgafn1DfBsn2NvBxPALK5MDr
 ixAH1HuDZdYDQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E2C6561132; Wed, 14 Apr 2021 15:08:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209345] [nouveau] unknown chipset (0f22d0a1) (nVidia Tesla K80)
Date: Wed, 14 Apr 2021 15:08:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209345-2300-iCSos2F7mA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209345-2300@https.bugzilla.kernel.org/>
References: <bug-209345-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209345

--- Comment #13 from Ilia Mirkin (imirkin@alum.mit.edu) ---
See comment #3 - it explains what you need to copy in nouveau to try to load
it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
