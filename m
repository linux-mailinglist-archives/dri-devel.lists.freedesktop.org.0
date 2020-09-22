Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA627411E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 13:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EF189791;
	Tue, 22 Sep 2020 11:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5E989791
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:45:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2633A22574
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600775158;
 bh=KhrRBx22Zo8YLhOA9Kmsv44o/2fP94Lgd5T40CutoBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FWJTE6FZ+J4+3x+ntnTY7/64zukYESEjiMiU5E6qFeJU30GV4POgqVGBpGRhXp9ty
 TBH5y1L1hwg/AbJJ7mXIDGkORCpNYdNx2sdKkqqG4/N6LPUxaE3yQH/9J4EegfRmCt
 c7XDKbCqIA88Y7+X3/RJcyxxbfxZj5EHA4Yn7Iu8=
Received: by mail-ed1-f51.google.com with SMTP id b12so15790104edz.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 04:45:58 -0700 (PDT)
X-Gm-Message-State: AOAM533MpgRtUTMbfQTlfZQPQWJVM5EvrlnJvkdDc5/O59oXnmKQUrR4
 CFgGOYNVMA+Up0Fxm7df9NSrkge/JKrlQgdB/6A=
X-Google-Smtp-Source: ABdhPJxPZwz2sZgxkwXAxO6r3UJuoTaSBzjBPnrsefm9nDa0zYZ4j5Qq7O92PIlts1wDcqr2WEJd93Xn/6QwzI6Xz3s=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr3529383edn.104.1600775156644; 
 Tue, 22 Sep 2020 04:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200921210233.21449-1-krzk@kernel.org>
 <20200921210610.GA5338@amd>
 <CAJKOXPdwQc86H-S=C4v_1VCbd7RhC2Soepj_2LqG1e_E_bgAug@mail.gmail.com>
 <20200922093637.GK4792@sirena.org.uk>
 <346f2ecd-a015-7f26-b68d-10cf6b5343b6@ti.com>
In-Reply-To: <346f2ecd-a015-7f26-b68d-10cf6b5343b6@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 22 Sep 2020 13:45:44 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfUsCMR4gbOvsasfgzhOe-7b3iHOboQeVhvKF7RvgQGsw@mail.gmail.com>
Message-ID: <CAJKOXPfUsCMR4gbOvsasfgzhOe-7b3iHOboQeVhvKF7RvgQGsw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: move Milo Kim to credits
To: Dan Murphy <dmurphy@ti.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Sep 2020 at 13:36, Dan Murphy <dmurphy@ti.com> wrote:
>
> All
>
> On 9/22/20 4:36 AM, Mark Brown wrote:
> > On Tue, Sep 22, 2020 at 09:08:37AM +0200, Krzysztof Kozlowski wrote:
> >> On Mon, 21 Sep 2020 at 23:06, Pavel Machek <pavel@ucw.cz> wrote:
> >>> I believe normal way would be to mark the entries "orphaned", not to
> >>> drop them altogether. Plus, I believe someone from TI is likely to
> >>> step up.
> >> These are entries for specific drivers so they are covered by the
> >> subsystem maintainers. You believe someone will step up, I believe if
> >> these were important for TI, they would find the person some time ago,
> >> so the emails won't bounce... This was similar with BQ chargers where
> > It's fairly common for mobile parts to get dropped relatively quickly as
> > the technology moves fairly quickly in that market, I think a lot of teh
> > parts that Milo was working on were mobile ones.
>
> These specific drivers don't see many patches applied to them. These
> drivers did have a few patches this year to fix random bugs.
>
> Since I have worked in these other subsystems if replacing the
> Maintainer is desired over removal then my name and email can be added
> like I did with Andrews.
>
> Dan Murphy <dmurphy@ti.com>

I will add then yours name in v2 of this patch. Thanks for taking care of these.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
