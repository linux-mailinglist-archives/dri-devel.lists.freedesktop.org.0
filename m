Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26A40764C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 13:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F01B6EB75;
	Sat, 11 Sep 2021 11:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659776EB74;
 Sat, 11 Sep 2021 11:37:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id c8so9825654lfi.3;
 Sat, 11 Sep 2021 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OH7k5hheyxg1MUCedpNHWtHaiF5Uc4KYbqMmcrZmi4Y=;
 b=qpCYLYxIcS2yXrChaWdHyW7Ss8QJvs8vsVMc6z/Lz5sIBwZLzGsGjH9mAkR+blWBjN
 yy6BXBlLxMGeflptAChclPAUs5kZXAxZelnxIl59vPfUoVdvwaHIth2VmmiPgojvm93C
 0h2bF0JDleldaTKWvTB4+qQghkzcEY0PtX9CFgGwma81JtqYuzv9EJOVHaVB6ArTsRU6
 ZXdjpq/6xGKN8rvC7+ACYPVQtgumFqvUUDAQ9QqxFPxSdRNjiTJewqRKY7Ctc+nLbbrF
 /z3NtuzSIM5zthV/yQLTy7FrkUW4HKTi9YOvy/O07Alx2oBQq2F/uz7ZL7tc1BTb51ED
 oxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OH7k5hheyxg1MUCedpNHWtHaiF5Uc4KYbqMmcrZmi4Y=;
 b=7SEONKKst2/WKH7btxQCdP0d3TX05UTfo8JkBOuUUlnoCxhsEQhxEgVzQUqZ4kHp6U
 Ei392ma3qlj0ScArMxrbk9erOtixe1puIO1hIwfjueOZtPADeXuB5KB5swsHtvB0ZgqA
 52NSoSaq+hWZI0hK1r87sWRuHJIkZc0jn8yOV6QBDGuQwdNzAoDErVX+axiJMQzL8YXJ
 yWriWCrw8IbbMgd+FkjR4dCBffkwP0boL8xtDZbR1hjydhoGSQmczvAcx91x8lzzCWV8
 9IQzLjfp1HXdNNMrmCHwFfA5Bhzot5dLhdUvdw5cwgBlxjcfqDHSODIC/e5zfFi5azyG
 o5Sg==
X-Gm-Message-State: AOAM530UPIkAbPzuf1G+v/MgEptj/YuP7eXncLT35zAlBZQ/Z8+ztJdq
 e7WK8cDHo+4Rqzru6kuuO8BnebNuKJkVtHoQhrc=
X-Google-Smtp-Source: ABdhPJyskWh8/D7TwvN2hoXvSu6rBcqwVmPt1VFcZ+Pi8cnx+Cp/Y7eb6N7eCshLCtbySTXEdSFBlVZujAb6xKXJlQ8=
X-Received: by 2002:a05:6512:1094:: with SMTP id
 j20mr1864930lfg.197.1631360272569; 
 Sat, 11 Sep 2021 04:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <d7487c6a-43c9-3940-4f42-b8fa31704e2e@infradead.org>
In-Reply-To: <d7487c6a-43c9-3940-4f42-b8fa31704e2e@infradead.org>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Sat, 11 Sep 2021 06:37:16 -0500
Message-ID: <CAPpdf59v2OyidgF_=Hpz9xY4=my9FFs_aDJgfh=scq2nec0QXw@mail.gmail.com>
Subject: Re: Intel UHD resolutions
To: Randy Dunlap <rdunlap@infradead.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008c1c1b05cbb6a94c"
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

--0000000000008c1c1b05cbb6a94c
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 9:50 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
>
> I would like to use QHD resolution (2560x1440) with my shiny new
> computer and display. That resolution works if I boot Windows 10
> (cough).
>
> What do I need to do to use that resolution in Linux?
>
>
Dunno if I can 'help' get everything going - - - - but I do have some
ideas (having had to fight a lot to get my graphics sub-system working).

Start up a terminal as your user and run $ xrandr --verbose and then if
you would paste the lines up to the end of the EDID blob here. (Need
more info that what you provided. )

Regards

--0000000000008c1c1b05cbb6a94c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 10, 2021 at 9:50 PM Randy=
 Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org" target=3D"_blank">rdun=
lap@infradead.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi,<br>
<br>
I would like to use QHD resolution (2560x1440) with my shiny new<br>
computer and display. That resolution works if I boot Windows 10<br>
(cough).<br>
<br>
What do I need to do to use that resolution in Linux?<br><br></blockquote><=
div><br></div><div>Dunno if I can &#39;help&#39; get everything going - - -=
 - but I do have some=C2=A0</div><div>ideas (having had to fight a lot to g=
et my graphics sub-system working).=C2=A0=C2=A0</div><div><br></div><div>St=
art up a terminal as your user and run $ xrandr --verbose and then if=C2=A0=
</div><div>you would paste the lines up to the end of the EDID blob here. (=
Need=C2=A0</div><div>more info that what you provided. )=C2=A0</div><div><b=
r></div><div>Regards</div></div></div>

--0000000000008c1c1b05cbb6a94c--
