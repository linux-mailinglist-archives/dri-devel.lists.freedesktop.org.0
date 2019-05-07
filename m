Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030EA1648C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C302689178;
	Tue,  7 May 2019 13:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199B689178
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 13:28:02 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id p27so3801672eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 06:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ljryfdc1PIUzZ4d+3eICO9PgyywNfOo0C0fF/jXGyIU=;
 b=Ggg97QWpokbR3z/C0gL260hBF43bCY6SzftGfNyKmDazMsdWi7GwDiTNOq4kVuCiok
 1p32pBHQ/TFhpAdvuRahaxmtWL5E6udSDBCn/iE7/KoH2kZANFInpv+G2W9btIqloKNu
 Y8x1SRHPZD1PieItuTAzTspKx6sQPFwPQxQx28EmpqbfB/BuatGkSz/dba9btovaveVe
 YULANom1qpe8YunXwI0rStnIBBWWSiI5ND+IBnsIAjgX78q/QkJ6J2vvawtFW5ATQkKW
 DT+3IaOZw0z3RKLIV7xBYz4xEPkuaZ7mBRxMccfLwz2Gb0Ui+rG3R5kaaTNJReQHEEEE
 Hnsg==
X-Gm-Message-State: APjAAAUKn8Ctbe4S0uqMwSkLMYlB4rjRy9XM9/+tj8s3S1Y8Tm7qmH37
 SkCUipNOcEreiXbOkncFDTVXVGSGZWmFeFDlI45MR9DG
X-Google-Smtp-Source: APXvYqwxGrQz1QGZKyg59X/JV6AYA8+5KWdl95zI1zei3Wph1dm/17D4aAhp8cAvk6NAnbUQBKmSMZSkA6VX1re3U88=
X-Received: by 2002:a17:906:2583:: with SMTP id
 m3mr24358155ejb.74.1557235680478; 
 Tue, 07 May 2019 06:28:00 -0700 (PDT)
MIME-Version: 1.0
From: Karthik Guru <karth251998@gmail.com>
Date: Tue, 7 May 2019 18:57:49 +0530
Message-ID: <CAKzjFstQdAM8tY-8YhF5HDtoZGMcuJnRXYQswnwgsnyvAbKR7A@mail.gmail.com>
Subject: XORG Endless Vacation of Code
To: dri-devel@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ljryfdc1PIUzZ4d+3eICO9PgyywNfOo0C0fF/jXGyIU=;
 b=plX4qNrEP8eljLqYzaoOnATUe54Q+KvITEwTl+sSqdBZ+ZE3B7QQpuFfzf1mu23rA9
 nK55fjilvUYHvnXcj+gOPyVLOq2b1aR1UBHPLZ8MaFCOdSawM3JQcO3xmvo+n0WrPTDp
 VffUxY/HUSSfXFBJIh84YJ8ef0uCpyXiYCH1qwdMKe7FsrHdk1XFHN0tZ3I/zX22IdFY
 wsqicbGIZR9AKDUOotxwD+QgQ0pqgP+LSJR8ZFytsI7E/hHn7nuVZTl2bxIcvzixTB8F
 7+vgylMeKX8gOAPtIlbk3tUzb2AcqmuTACjrEH5bkMLKyjkcUH4JerH7/TpIiO5wpXCe
 F/dQ==
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
Content-Type: multipart/mixed; boundary="===============1387949396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1387949396==
Content-Type: multipart/alternative; boundary="000000000000910af505884c2f50"

--000000000000910af505884c2f50
Content-Type: text/plain; charset="UTF-8"

Hey

Could you please tell me if applications are open for XORG EVOC?

Also, whats the procedure for writing a proposal for any of the projects

Thanks!

--000000000000910af505884c2f50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey=C2=A0<div><br></div><div>Could you please tell me if a=
pplications are open for XORG EVOC?</div><div><br></div><div>Also, whats th=
e procedure for writing a proposal for any of the projects</div><div><br></=
div><div>Thanks!</div></div>

--000000000000910af505884c2f50--

--===============1387949396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1387949396==--
