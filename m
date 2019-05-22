Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D825B1A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 02:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D64089683;
	Wed, 22 May 2019 00:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8680089683
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 00:19:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8337972167; Wed, 22 May 2019 00:19:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110701] GPU faults in in Unigine Valley 1.0
Date: Wed, 22 May 2019 00:19:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stalkerg@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110701-502-So4TUZuHIz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110701-502@http.bugs.freedesktop.org/>
References: <bug-110701-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0357567439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0357567439==
Content-Type: multipart/alternative; boundary="15584843911.dDA6BBC0.18507"
Content-Transfer-Encoding: 7bit


--15584843911.dDA6BBC0.18507
Date: Wed, 22 May 2019 00:19:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

--- Comment #24 from Yury Zhuravlev <stalkerg@gmail.com> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #23)
> Fixed by d6053bf2a170a0fec6d232fda097d2f35f0e9eae. Closing.

The original issue was about Vega and on Vega we saw a different problem. I
suppose before close issue somebody should check patch on Vega.=20
I will do it soon.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584843911.dDA6BBC0.18507
Date: Wed, 22 May 2019 00:19:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - GPU faults in in Unigine Valley 1.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110701">bug 11070=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stalkerg&#64;gmail.com" title=3D"Yury Zhuravlev &lt;stalkerg&#64;gmail.com&=
gt;"> <span class=3D"fn">Yury Zhuravlev</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D110701#c23">comment #23</a>)
<span class=3D"quote">&gt; Fixed by d6053bf2a170a0fec6d232fda097d2f35f0e9ea=
e. Closing.</span >

The original issue was about Vega and on Vega we saw a different problem. I
suppose before close issue somebody should check patch on Vega.=20
I will do it soon.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584843911.dDA6BBC0.18507--

--===============0357567439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0357567439==--
