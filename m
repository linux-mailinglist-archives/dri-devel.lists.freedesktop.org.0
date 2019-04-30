Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10262F331
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 11:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4071C890D2;
	Tue, 30 Apr 2019 09:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD1C890D2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 09:41:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h4so20196203wre.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 02:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1qjt3f73SZUMB1BCvg6fEafpFrMK32xQekVOHf8HxE=;
 b=A9Z7TZbkjSoejyoWDb93qRztksvBYAgpfyiGHr5IoOigM13D/3Q+JXOScdnFkSBHNv
 Y9+tDuPoFtPpsHrTB2lxI9hrC33mJQXp9TAX30cdYh6JGNwNuvE+YzOXimSnzE0/oVCY
 2x/NbonD8EfUR0UkmdoWS+nh+yPrmB0npWNI2DgVDeTqh4VNp7lvhxxVQhwIkuRJ3Uvr
 ak0KaQqUeiF686Q3d6XdlEu38zbUGlRBKjrQF+GC2NewYZdXzLOWfUYSG948DJpMC9gm
 CaETbt3sAJ3cP2i/Fz8Z5at80rE0E60Z6nMDGEdhLu3OD8JzSzFGKC7jz2C/xOMlir9n
 KzdA==
X-Gm-Message-State: APjAAAWcAp12ie5/hM4cHcTOJrOAFzXQsgz3YWbHcHkCUmToOt9c7cdw
 jJyg5PGN+TrccAFkh0wwO2cuEfjF
X-Google-Smtp-Source: APXvYqw1HhAlp1IbcENLXL7/kbLZXQ/DeQ0iGS45R6emO9SRRif/pATmwSWHie46XQ3NY1jev0dDog==
X-Received: by 2002:a5d:6347:: with SMTP id b7mr3804040wrw.1.1556617287002;
 Tue, 30 Apr 2019 02:41:27 -0700 (PDT)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c204sm3260784wmd.0.2019.04.30.02.41.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 02:41:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: drop Jerry as TTM maintainer
Date: Tue, 30 Apr 2019 11:41:25 +0200
Message-Id: <20190430094125.6272-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1qjt3f73SZUMB1BCvg6fEafpFrMK32xQekVOHf8HxE=;
 b=kEQL0K2A/RfCTE+ZAuJyfazYfPTrlGPI+Zl602jsajExakBHmm3Ce44hX2BHoJgvZJ
 b4nWLq4eT6gAaCSUk0dPLp7YiucQyUed8FrW5O+hwgtQol/MZBgvnNmvgITwxgEdofGR
 72jKY0R/g/nZSZhLBUnyyHHaaq6OJqx5PDNGFo8qXoRK98QUfXn9bp/M86qjqsuagfGy
 TXoRHydjQUWllK7UsurLJXFirRnvgBRTwz3Eb+afMp2YNc2sLyLa0i4WllxGUnQc1352
 apzPlBz25aWLZ+XfcckFszEBkGqFYqHqYMJYVvRRMgiJUaE/81nBCYlMBsMz0pybXGxg
 NAHg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGUgdW5mb3J0dW5hdGVseSBkb2Vzbid0IHdvcmsgZm9yIEFNRCBhbnkgbW9yZS4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBN
QUlOVEFJTkVSUyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDNkMTk5NTkyZmQyYy4uYzUyYTlm
NWI5ZmU0IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNTM2
OSw3ICs1MzY5LDYgQEAgRjoJRG9jdW1lbnRhdGlvbi9ncHUveGVuLWZyb250LnJzdAogRFJNIFRU
TSBTVUJTWVNURU0KIE06CUNocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KIE06CUh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci1NOglKdW53ZWkgWmhhbmcgPEpl
cnJ5LlpoYW5nQGFtZC5jb20+CiBUOglnaXQgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+
YWdkNWYvbGludXgKIFM6CU1haW50YWluZWQKIEw6CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
