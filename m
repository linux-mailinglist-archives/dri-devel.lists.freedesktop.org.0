Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E9EFE87
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4986EA5D;
	Tue,  5 Nov 2019 13:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0AB6E8DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 02:23:26 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 193so12685484pfc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 18:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LsXcsm2GHHqu1Vt0Snl+ykY6IrvFVgDaD/4d0g8GINY=;
 b=ThOhw7F+Hk5m/hTYZYerqsH4B/q9xiJAdzKiOsGsY28uRGdXNBknQxDucKXhNqh2iG
 2BcZV3ROh+T1w+RGVri5p/5AgtivSw58eHQGq8ViVQ82j8fSBxbOsbBIbiDfKh+3l92R
 +PvICvXW9M/wBfn8T19vsEu+ni9i8km1w0EmbzbDTgWOoXnqxjiwy1eZxOGAYlA2cPNC
 axKT+GrJUSA+Pf8O1LbmMumIews0LSl1e/SbjTvTYurtiGVJ5uGrhshdudCHam57Ek0O
 jLfSTJovn0+Lu51+lNy9fffcTLytf44rOB0+do9ySBWg/+1l1UBfcYgvXsJ2Ta0jY5Pq
 sh3A==
X-Gm-Message-State: APjAAAXQ/wYlt+lMZdsNd9H286wv5J853xZEAp74h91DLp02LyDDhYaE
 xDoyrLR6QkCWcHMx7s+oZ78=
X-Google-Smtp-Source: APXvYqweZZE4NYDUt6+1uB6wHOE5HaTdK/3N36YwRyrmUabnLKxDDxU8a6uzOAi5vimdNvr33VNVOg==
X-Received: by 2002:a65:5a06:: with SMTP id y6mr34196253pgs.9.1572920605692;
 Mon, 04 Nov 2019 18:23:25 -0800 (PST)
Received: from jamal-desktop (97-126-66-56.tukw.qwest.net. [97.126.66.56])
 by smtp.gmail.com with ESMTPSA id w10sm16031382pjq.3.2019.11.04.18.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 18:23:25 -0800 (PST)
From: Jamal Shareef <jamal.k.shareef@gmail.com>
To: outreachy-kernel@googlegroups.com
Subject: [PATCH 0/3] drm/tegra: Remove space after parenthesis
Date: Mon,  4 Nov 2019 18:23:19 -0800
Message-Id: <cover.1572920482.git.jamal.k.shareef@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LsXcsm2GHHqu1Vt0Snl+ykY6IrvFVgDaD/4d0g8GINY=;
 b=ffDI3R2T1dHvht2x5jtqWsQFPVQsa8dQxv0de3i0FqfFCz9qe722OVOayADpggb0zp
 cRcKLc3irCZdLVoVDFEmdcNxyw4waGj+55YVeG67+KOdIMOhh4bhzdxDHTcoQOjwfP0V
 YnrCZu8mtIy3zPDBHIgvEilMjHmF4OSLwa5d7ScG+3jPOiEyTpgj/5Vv1Jsue9YY1F8s
 BQqnovAb2IzvEnfV5BKKR/+rbu4F2D+RJQ6DgWQ6lcAC3+4R1L0hy6qkrQxuQu5bVq/R
 m0pf3MYwuHf03Ix8nOZnH2Pd1wswSjXT2vbSMKBbbMMLL0HHaPS+7haIAuV5ox2UE7Ye
 s/Dg==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 Jamal Shareef <jamal.k.shareef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCByZW1vdmVzIHNwYWNlcyBhZnRlciBsZWZ0IG9wZW4gcGFyZW50aGVzaXMu
Cklzc3VlIGZvdW5kIGJ5IGNoZWNrcGF0Y2guCgpKYW1hbCBTaGFyZWVmICgzKToKICBkcm0vdGVn
cmE6IGRjOiBSZW1vdmUgc3BhY2UgYWZ0ZXIgcGFyZW50aGVzaXMKICBkcm0vdGVncmE6IGRzaTog
UmVtb3ZlIHNwYWNlIGluIG9wZW4gcGFyZW50aGVzaXMKICBkcm0vdGVncmE6IGdyM2Q6IFJlbW92
ZSBzcGFjZSBhZnRlciBwYXJlbnRoZXNpcwoKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oICAg
fCAgNDAgKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHNpLmMgIHwgIDYwICsr
KysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dyM2QuYyB8IDEyMCArKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5z
ZXJ0aW9ucygrKSwgMTEwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
